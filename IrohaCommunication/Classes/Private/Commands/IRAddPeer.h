#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRAddPeer : NSObject<IRAddPeer>

- (nonnull instancetype)initWithAddress:(nonnull id<IRAddress>)address
                              publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey;

@end
