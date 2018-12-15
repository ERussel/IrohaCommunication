@import Foundation;
@import IrohaCrypto;

#import "IRTransaction.h"
#import "IRAccountId.h"
#import "IRDomain.h"
#import "IRAssetId.h"
#import "IRRoleName.h"
#import "IRGrantablePermission.h"
#import "IRRolePermission.h"
#import "IRAmount.h"
#import "IRAddress.h"

@class Command;

@protocol IRTransactionBuilderProtocol <NSObject>

- (nonnull instancetype)withCreatorAccountId:(nonnull id<IRAccountId>)creatorAccountId;
- (nonnull instancetype)withCreatedDate:(nonnull NSDate*)date;
- (nonnull instancetype)withQuorum:(NSUInteger)quorum;
- (nonnull instancetype)addCommand:(nonnull Command*)command;

- (nullable IRTransaction*)build:(NSError **)error;

@end

@interface IRTransactionBuilder : NSObject<IRTransactionBuilderProtocol>

- (nonnull instancetype)addAssetQuantity:(nonnull id<IRAssetId>)assetId
                          amount:(nonnull id<IRAmount>)amount;

- (nonnull instancetype)subtractAssetQuantity:(nonnull id<IRAssetId>)assetId
                               amount:(nonnull id<IRAmount>)amount;

- (nonnull instancetype)addPeer:(nonnull id<IRAddress>)address
              publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

- (nonnull instancetype)addSignatory:(nonnull id<IRAccountId>)accountId
                           publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

- (nonnull instancetype)removeSignatory:(nonnull id<IRAccountId>)accountId
                              publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

- (nonnull instancetype)appendRole:(nonnull id<IRAccountId>)accountId
                          roleName:(nonnull id<IRRoleName>)roleName;

- (nonnull instancetype)createAccount:(nonnull id<IRAccountId>)accountId
                            publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

- (nonnull instancetype)createAsset:(nonnull id<IRAssetId>)assetId
                          precision:(UInt32)precision;

- (nonnull instancetype)createDomain:(nonnull id<IRDomain>)domainId
                         defaultRole:(nonnull id<IRRoleName>)defaultRole;

- (nonnull instancetype)createRole:(nonnull id<IRRoleName>)roleName
                       permissions:(nonnull NSSet<id<IRRolePermission>>*)permissions;

- (nonnull instancetype)detachRole:(nonnull id<IRAccountId>)accountId
                          roleName:(nonnull id<IRRoleName>)roleName;

- (nonnull instancetype)grantPermission:(nonnull id<IRAccountId>)accountId
                              permission:(nonnull id<IRGrantablePermission>)grantablePermission;

- (nonnull instancetype)revokePermission:(nonnull id<IRAccountId>)accountId
                              permission:(nonnull id<IRGrantablePermission>)grantablePermission;

- (nonnull instancetype)setAccountDetail:(nonnull id<IRAccountId>)accountId
                                      key:(nonnull NSString*)key
                                    value:(nonnull NSString*)value;

- (nonnull instancetype)setAccountQuorum:(nonnull id<IRAccountId>)accountId
                                  quorum:(UInt32)quorum;

- (nonnull instancetype)transferAsset:(nonnull id<IRAccountId>)sourceAccountId
                   destinationAccount:(nonnull id<IRAccountId>)destinationAccountId
                              assetId:(nonnull id<IRAssetId>)assetId
                          description:(nonnull NSString*)transferDescription
                               amount:(nonnull id<IRAmount>)amount;

@end
