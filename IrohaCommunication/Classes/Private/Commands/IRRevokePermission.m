#import "IRRevokePermission.h"

@implementation IRRevokePermission
@synthesize accountId = _accountId;
@synthesize permission = _permission;

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                               permission:(nonnull id<IRGrantablePermission>)permission {

    if (self = [super init]) {
        _accountId = accountId;
        _permission = permission;
    }

    return self;
}

@end
