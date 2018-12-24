#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRCreateRole : NSObject<IRCreateRole>

- (nonnull instancetype)initWithRoleName:(nonnull id<IRRoleName>)roleName
                             permissions:(nonnull NSArray<id<IRRolePermission>>*)permissions;

@end
