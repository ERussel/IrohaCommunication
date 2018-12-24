#import "IRAppendRole.h"

@implementation IRAppendRole
@synthesize accountId = _accountId;
@synthesize roleName = _roleName;

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                 roleName:(nonnull id<IRRoleName>)roleName {

    if (self = [super init]) {
        _accountId = accountId;
        _roleName = roleName;
    }

    return self;
}

@end
