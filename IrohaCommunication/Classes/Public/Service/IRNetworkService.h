#import <Foundation/Foundation.h>
#import "IRTransaction.h"
#import "IRQueryRequest.h"
#import "IRTransactionStatusResponse.h"
#import "IRPromise.h"

typedef void (^IRTransactionStatusBlock)(id<IRTransactionStatusResponse> _Nullable response, BOOL done, NSError * _Nullable error);

typedef NS_ENUM(NSUInteger, IRNetworkServiceError) {
    IRNetworkServiceErrorTransactionStatusNotReceived
};

@interface IRNetworkService : NSObject

- (nonnull instancetype)initWithAddress:(nonnull id<IRAddress>)address;

- (nonnull IRPromise *)sendTransaction:(nonnull id<IRTransaction>)transaction;

- (nonnull IRPromise *)onTransactionStatus:(IRTransactionStatus)transactionStatus
                                  withHash:(nonnull NSData*)transactionHash;

- (nonnull IRPromise *)fetchTransactionStatus:(nonnull NSData*)transactionHash;

- (void)listenTransactionStatus:(nonnull NSData*)transactionHash
                      withBlock:(nonnull IRTransactionStatusBlock)block;

- (nonnull IRPromise*)performQuery:(nonnull id<IRQueryRequest>)queryRequest;

@end
