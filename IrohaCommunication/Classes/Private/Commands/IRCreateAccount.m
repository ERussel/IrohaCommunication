#import "IRCreateAccount.h"

@implementation IRCreateAccount
@synthesize accountId = _accountId;
@synthesize publicKey = _publicKey;

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey {

    if (self = [super init]) {
        _accountId = accountId;
        _publicKey = publicKey;
    }

    return self;
}

@end
