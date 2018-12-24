#import "IRSetAccountDetail.h"

@implementation IRSetAccountDetail
@synthesize accountId = _accountId;
@synthesize key = _key;
@synthesize value = _value;

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                      key:(nonnull NSString*)key
                                    value:(nonnull NSString*)value {

    if (self = [super init]) {
        _accountId = accountId;
        _key = key;
        _value = value;
    }

    return self;
}

@end
