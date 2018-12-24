#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRCreateAccount : NSObject<IRCreateAccount>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

@end
