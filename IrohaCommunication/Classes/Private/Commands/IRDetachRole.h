#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRDetachRole : NSObject<IRDetachRole>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                 roleName:(nonnull id<IRRoleName>)roleName;

@end
