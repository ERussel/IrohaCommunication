#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRRevokePermission : NSObject<IRRevokePermission>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                               permission:(nonnull id<IRGrantablePermission>)permission;

@end
