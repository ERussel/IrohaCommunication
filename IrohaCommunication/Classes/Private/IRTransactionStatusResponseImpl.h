#import <Foundation/Foundation.h>
#import "IRTransactionStatusResponse.h"

@interface IRTransactionStatusResponseImpl : NSObject<IRTransactionStatusResponse>

- (nonnull instancetype)initWithStatus:(IRTransactionStatus)status
                       transactionHash:(nonnull NSData*)transactionHash
                           description:(nullable NSString*)statusDescription;

@end
