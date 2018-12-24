#import "IRAddPeer.h"

@implementation IRAddPeer
@synthesize address = _address;
@synthesize publicKey = _publicKey;

- (nonnull instancetype)initWithAddress:(nonnull id<IRAddress>)address
                              publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey {
    
    if (self = [super init]) {
        _address = address;
        _publicKey = publicKey;
    }

    return self;
}

@end
