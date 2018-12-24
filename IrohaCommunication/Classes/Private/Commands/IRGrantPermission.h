#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRGrantPermission : NSObject<IRGrantPermission>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                               permission:(nonnull id<IRGrantablePermission>)permission;

@end
