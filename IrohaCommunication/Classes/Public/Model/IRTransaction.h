#ifndef IRTransaction_h
#define IRTransaction_h

#import "IRCommand.h"
#import "IRSignable.h"
#import "IRPeerSignature.h"
#import <IrohaCrypto/IRSignature.h>

@protocol IRTransaction <NSObject, IRSignable>

@property(nonatomic, readonly)id<IRAccountId> _Nonnull creator;
@property(nonatomic, readonly)NSDate* _Nonnull createdAt;
@property(nonatomic, readonly)NSArray<id<IRCommand>>* _Nonnull commands;
@property(nonatomic, readonly)NSUInteger quorum;
@property(nonatomic, readonly)NSArray<id<IRPeerSignature>>* _Nonnull signatures;

- (nullable instancetype)signedWithSignatories:(nonnull NSArray<id<IRSignatureCreatorProtocol>>*)signatories
                           signatoryPublicKeys:(nonnull NSArray<id<IRPublicKeyProtocol>> *)signatoryPublicKeys
                                         error:(NSError**)error;

- (nullable NSData*)transactionHashWithError:(NSError **)error;

@end

#endif /* IRTransaction_h */
