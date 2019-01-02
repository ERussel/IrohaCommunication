#import "IRNetworkService.h"
#import "Endpoint.pbrpc.h"
#import "IRTransactionImpl.h"
#import "Transaction.pbobjc.h"
#import "IRTransactionStatusResponseImpl+Proto.h"
#import "GRPCCall+Tests.h"

@interface IRNetworkService()

@property(strong, nonatomic)CommandService_v1 *commandService;
@property(strong, nonatomic)QueryService_v1 *queryService;

@end

@implementation IRNetworkService

- (nonnull instancetype)initWithAddress:(nonnull id<IRAddress>)address {
    if (self = [super init]) {
        [GRPCCall useInsecureConnectionsForHost:address.value];

        _commandService = [[CommandService_v1 alloc] initWithHost:address.value];
        _queryService = [[QueryService_v1 alloc] initWithHost:address.value];
    }

    return self;
}

- (nonnull IRPromise *)sendTransaction:(nonnull id<IRTransaction>)transaction {
    IRPromise *promise = [IRPromise promise];

    if (![transaction conformsToProtocol:@protocol(IRProtobufTransformable)]) {
        NSString *message = @"Unsupported transaction implementation";
        NSError *error = [NSError errorWithDomain:NSStringFromClass([IRNetworkService class])
                                             code:IRTransactionErrorSerialization
                                         userInfo:@{NSLocalizedDescriptionKey: message}];

        [promise fulfillWithResult:error];
        return promise;
    }

    NSError *error;
    Transaction *pbTransaction = [(id<IRProtobufTransformable>)transaction transform:&error];

    if (!pbTransaction) {
        [promise fulfillWithResult:error];
        return promise;
    }

    GRPCProtoCall *call = [_commandService RPCToToriiWithRequest:pbTransaction
                                   handler:^(GPBEmpty * _Nullable response, NSError * _Nullable error) {
                                       if (error) {
                                           [promise fulfillWithResult: error];
                                       } else {
                                           [promise fulfillWithResult:nil];
                                       }
                                   }];
    [call start];

    return promise;
}

- (nonnull IRPromise *)onTransactionStatus:(IRTransactionStatus)transactionStatus
                                  withHash:(nonnull NSData*)transactionHash {
    TxStatusRequest *statusRequest = [[TxStatusRequest alloc] init];
    statusRequest.txHash = transactionHash;

    __block __weak GRPCProtoCall *weakCall = nil;

    IRPromise *promise = [IRPromise promise];

    __block NSMutableArray<NSNumber*> *receivedStatuses = [NSMutableArray array];

    id eventHandler = ^(BOOL done, ToriiResponse *response, NSError *error) {
        if (!weakCall) {
            return;
        }

        if (response) {
            NSError *parsingError;

            id<IRTransactionStatusResponse> statusResponse = [IRTransactionStatusResponseImpl statusResponseWithToriiResponse:response
                                                                                                                  error:&parsingError];

            [receivedStatuses addObject:@(statusResponse.status)];

            if (statusResponse && statusResponse.status == transactionStatus) {
                [promise fulfillWithResult:nil];

                [weakCall cancel];
                weakCall = nil;
            }
        } else if (done && !promise.isFulfilled) {
            if (error) {
                [promise fulfillWithResult:error];
            } else {
                NSString *message = [NSString stringWithFormat:@"Received statuses [%@], but waited for %@. Streaming closed.",
                                     [receivedStatuses componentsJoinedByString:@","], @(transactionStatus)];
                NSError *networkError = [NSError errorWithDomain:NSStringFromClass([IRNetworkService class])
                                                            code:IRNetworkServiceErrorTransactionStatusNotReceived
                                                        userInfo:@{NSLocalizedDescriptionKey: message}];
                [promise fulfillWithResult:networkError];
            }
        }
    };

    GRPCProtoCall *call = [_commandService RPCToStatusStreamWithRequest:statusRequest
                                                           eventHandler:eventHandler];
    weakCall = call;

    [call start];

    return promise;
}

- (void)listenTransactionStatus:(nonnull NSData*)transactionHash
                      withBlock:(nonnull IRTransactionStatusBlock)block {
    TxStatusRequest *statusRequest = [[TxStatusRequest alloc] init];
    statusRequest.txHash = transactionHash;

    __weak typeof(self) weakSelf = self;

    [_commandService statusStreamWithRequest: statusRequest
                                eventHandler:^(BOOL done, ToriiResponse *response, NSError *error) {
                                    [weakSelf proccessTransactionStatusResponse:response
                                                                          error:error
                                                                           done:done
                                                                        handler:block];
    }];
}

#pragma mark - Private

- (void)proccessTransactionStatusResponse:(nullable ToriiResponse *)toriiResponse
                                    error:(nullable NSError *)error
                                     done:(BOOL)done
                                  handler:(nonnull IRTransactionStatusBlock)handler {
    if (toriiResponse) {
        NSError *parsingError;
        id<IRTransactionStatusResponse> statusResponse = [IRTransactionStatusResponseImpl statusResponseWithToriiResponse:toriiResponse
                                                                                                                    error:&parsingError];

        handler(statusResponse, done, parsingError);
    } else {
        handler(nil, done, error);
    }
}

@end
