#import "IRCreateDomain.h"

@implementation IRCreateDomain
@synthesize domainId = _domainId;
@synthesize defaultRole = _defaultRole;

- (nonnull instancetype)initWithDomain:(nonnull id<IRDomain>)domain
                           defaultRole:(nullable id<IRRoleName>)defaultRole {

    if (self = [super init]) {
        _domainId = domain;
        _defaultRole = defaultRole;
    }

    return self;
}

@end
