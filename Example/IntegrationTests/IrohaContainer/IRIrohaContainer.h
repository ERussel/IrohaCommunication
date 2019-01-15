#import <Foundation/Foundation.h>

@interface IRIrohaContainer : NSObject

+ (nonnull instancetype)shared;

- (nullable NSError*)start;
- (nullable NSError*)stop;

@end
