#import "IRTransactionImpl.h"
#import "Transaction.pbobjc.h"
#import "Commands.pbobjc.h"
#import "Primitive.pbobjc.h"
#import "IRProtobufTransformable.h"
#import "IrohaCrypto/NSData+SHA3.h"
#import "NSDate+IrohaCommunication.h"

@implementation IRTransaction
@synthesize creator = _creator;
@synthesize createdAt = _createdAt;
@synthesize commands = _commands;
@synthesize quorum = _quorum;
@synthesize signatures = _signatures;

- (nonnull instancetype)initWithCreatorAccountId:(nonnull id<IRAccountId>)creatorAccountId
                                       createdAt:(nonnull NSDate*)createdAt
                                        commands:(nonnull NSArray<id<IRCommand>>*)commands
                                          quorum:(NSUInteger)quorum
                                      signatures:(nonnull NSArray<id<IRPeerSignature>>*)signatures {

    if (self = [super init]) {
        _creator = creatorAccountId;
        _createdAt = createdAt;
        _commands = commands;
        _quorum = quorum;
        _signatures = signatures;
    }

    return self;
}

#pragma mark - Protobuf Transformable

- (nullable id)transform:(NSError *__autoreleasing *)error {
    Transaction_Payload *payload = [self createPayload:error];

    if (!payload) {
        return nil;
    }

    Transaction *transaction = [[Transaction alloc] init];
    transaction.payload = payload;

    NSMutableArray<Signature*> *rawSignatures = [NSMutableArray array];
    for (id<IRPeerSignature> signature in _signatures) {
        Signature *protobufSignature = [[Signature alloc] init];
        protobufSignature.signature = [signature.signature rawData];
        protobufSignature.publicKey = [signature.publicKey rawData];

        [rawSignatures addObject:protobufSignature];
    }

    transaction.signaturesArray = rawSignatures;

    return transaction;
}

#pragma mark - Signable

- (nullable id<IRPeerSignature>)signWithSignatory:(nonnull id<IRSignatureCreatorProtocol>)signatory
                               signatoryPublicKey:(nonnull id<IRPublicKeyProtocol>)signatoryPublicKey
                                            error:(NSError**)error {

    Transaction_Payload *payload = [self createPayload:error];

    if (!payload) {
        return nil;
    }

    id<IRSignatureProtocol> signature = [self signPayload:payload
                                                signatory:signatory
                                                    error:error];

    id<IRPeerSignature> peerSignature = [IRPeerSignatureFactory peerSignature:signature
                                                                    publicKey:signatoryPublicKey
                                                                        error:error];

    return peerSignature;
}

- (nullable instancetype)signedWithSignatories:(nonnull NSArray<id<IRSignatureCreatorProtocol>>*)signatories
                           signatoryPublicKeys:(nonnull NSArray<id<IRPublicKeyProtocol>> *)signatoryPublicKeys
                                         error:(NSError**)error {

    if ([signatories count] != [signatoryPublicKeys count]) {
        if (error) {
            NSString *message = @"Number of signatories must be the same as number of public keys.";
            *error = [IRTransaction signingErrorWithMessage:message];
        }

        return nil;
    }

    Transaction_Payload *payload = [self createPayload:error];

    if (!payload) {
        return nil;
    }

    NSMutableArray<id<IRPeerSignature>> *peerSignatures = [NSMutableArray array];
    for(NSUInteger i = 0; i < [signatories count]; i++) {
        id<IRSignatureProtocol> signature = [self signPayload:payload
                                                    signatory:signatories[i]
                                                        error:error];

        if (!signature) {
            return nil;
        }

        id<IRPeerSignature> peerSignature = [IRPeerSignatureFactory peerSignature:signature
                                                                        publicKey:signatoryPublicKeys[i]
                                                                            error:error];

        if (!peerSignature) {
            return nil;
        }

        [peerSignatures addObject:peerSignature];
    }

    NSMutableArray *appendedSignatures = [_signatures mutableCopy];
    [appendedSignatures addObjectsFromArray:peerSignatures];

    return [[IRTransaction alloc] initWithCreatorAccountId:_creator
                                                 createdAt:_createdAt
                                                  commands:_commands
                                                    quorum:_quorum
                                                signatures:appendedSignatures];
}

#pragma mark - Private

- (nullable Transaction_Payload*)createPayload:(NSError**)error {
    NSMutableArray<Command*> *protobufCommands = [NSMutableArray array];

    for (id<IRCommand> command in _commands) {
        if (![command conformsToProtocol:@protocol(IRProtobufTransformable)]) {
            if (error) {
                NSString *message = [NSString stringWithFormat:@"%@ command must conform %@",
                                     NSStringFromClass([command class]),
                                     NSStringFromProtocol(@protocol(IRProtobufTransformable))];

                *error = [IRTransaction serializationErrorWithMessage:message];
            }
            return nil;
        }

        id protobufCommand = [(id<IRProtobufTransformable>)command transform:error];

        if (![protobufCommand isKindOfClass:[Command class]]) {
            if (error) {
                NSString *message = [NSString stringWithFormat:@"%@ command must tranform %@",
                                     NSStringFromClass([command class]),
                                     NSStringFromProtocol(@protocol(IRProtobufTransformable))];

                *error = [IRTransaction serializationErrorWithMessage:message];
            }
            return nil;
        }

        [protobufCommands addObject:(Command*)protobufCommand];
    }

    Transaction_Payload_ReducedPayload *reducedPayload = [[Transaction_Payload_ReducedPayload alloc] init];
    reducedPayload.commandsArray = protobufCommands;
    reducedPayload.creatorAccountId = [_creator identifier];
    reducedPayload.createdTime = [_createdAt milliseconds];
    reducedPayload.quorum = (uint32_t)_quorum;

    Transaction_Payload *payload = [[Transaction_Payload alloc] init];
    payload.reducedPayload = reducedPayload;

    return payload;
}

- (nullable id<IRSignatureProtocol>)signPayload:(nonnull Transaction_Payload*)payload
                                      signatory:(nonnull id<IRSignatureCreatorProtocol>)signatory
                                          error:(NSError**)error {
    NSData *payloadData = [payload data];

    if (!payloadData) {
        if (error) {
            NSString *message = @"Empty payload received";
            *error = [IRTransaction signingErrorWithMessage:message];
        }
        return nil;
    }

    NSData *sha3Data = [payloadData sha3:IRSha3Variant256];

    if (!sha3Data) {
        if (error) {
            NSString *message = @"Hashing function failed";
            *error = [IRTransaction signingErrorWithMessage:message];
        }
        return nil;
    }

    id<IRSignatureProtocol> signature = [signatory sign:sha3Data];

    if (!signature) {
        if (error) {
            NSString *message = @"Signing function failed";
            *error = [IRTransaction signingErrorWithMessage:message];
        }
        return nil;
    }

    return signature;
}

#pragma mark - Helpers

+ (nonnull NSError*)signingErrorWithMessage:(nonnull NSString*)message {
    return [NSError errorWithDomain:NSStringFromClass([IRTransaction class])
                               code:IRTransactionErrorSigning
                           userInfo:@{NSLocalizedDescriptionKey: message}];
}

+ (nonnull NSError*)serializationErrorWithMessage:(nonnull NSString*)message {
    return [NSError errorWithDomain:NSStringFromClass([IRTransaction class])
                               code:IRTransactionErrorSerialization
                           userInfo:@{NSLocalizedDescriptionKey: message}];
}

@end
