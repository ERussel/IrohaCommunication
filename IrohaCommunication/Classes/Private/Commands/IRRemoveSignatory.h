#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRRemoveSignatory : NSObject<IRRemoveSignatory>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

@end
