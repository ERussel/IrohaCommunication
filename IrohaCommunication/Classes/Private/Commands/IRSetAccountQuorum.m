#import "IRSetAccountQuorum.h"

@implementation IRSetAccountQuorum
@synthesize accountId = _accountId;
@synthesize quorum = _quorum;

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                   quorum:(UInt32)quorum {

    if (self = [super init]) {
        _accountId = accountId;
        _quorum = quorum;
    }

    return self;
}

@end
