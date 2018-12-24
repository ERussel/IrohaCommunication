#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRAddSignatory : NSObject<IRAddSignatory>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                 publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

@end
