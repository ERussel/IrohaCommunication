#import "IRCreateRole.h"

@implementation IRCreateRole
@synthesize roleName = _roleName;
@synthesize permissions = _permissions;

- (nonnull instancetype)initWithRoleName:(nonnull id<IRRoleName>)roleName
                             permissions:(nonnull NSArray<id<IRRolePermission>>*)permissions {

    if (self = [super init]) {
        _roleName = roleName;
        _permissions = permissions;
    }

    return self;
}

@end
