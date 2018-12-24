#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRCreateDomain : NSObject<IRCreateDomain>

- (nonnull instancetype)initWithDomain:(nonnull id<IRDomain>)domain
                           defaultRole:(nullable id<IRRoleName>)defaultRole;

@end
