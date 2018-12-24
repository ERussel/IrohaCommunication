#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRSetAccountDetail : NSObject<IRSetAccountDetail>

- (nonnull instancetype)initWithAccountId:(nonnull id<IRAccountId>)accountId
                                      key:(nonnull NSString*)key
                                    value:(nonnull NSString*)value;

@end
