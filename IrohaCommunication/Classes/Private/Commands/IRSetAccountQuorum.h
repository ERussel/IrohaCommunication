#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRSetAccountQuorum : NSObject<IRSetAccountQuorum>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                   quorum:(UInt32)quorum;

@end
