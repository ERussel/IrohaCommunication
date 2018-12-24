#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRAppendRole : NSObject<IRAppendRole>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                 roleName:(nonnull id<IRRoleName>)roleName;

@end
