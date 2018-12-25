#import "NSDate+IrohaCommunication.h"

@implementation NSDate (IrohaCommunication)

- (UInt64)milliseconds {
    return (UInt64)([self timeIntervalSince1970] * 1000);
}

@end
