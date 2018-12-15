#import "IRAmount.h"

static NSString * const DECIMAL_SEPARATOR = @".";

@interface IRAmount : NSObject<IRAmount>

- (instancetype)initWithString:(nonnull NSString*)amountString;

@end

@implementation IRAmount
@synthesize value = _value;

- (instancetype)initWithString:(nonnull NSString*)amountString {
    if (self = [super init]) {
        _value = amountString;
    }

    return self;
}

@end

@implementation IRAmountFactory

+ (nullable id<IRAmount>)amountFromString:(nonnull NSString*)amount error:(NSError**)error {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithString:amount
                                                                       locale:@{NSLocaleDecimalSeparator: DECIMAL_SEPARATOR}];

    if (!decimalNumber || decimalNumber == [NSDecimalNumber notANumber]) {
        if (error) {
            NSString *message = @"Amount must be a valid decimal number with point separator";
            *error = [NSError errorWithDomain:NSStringFromClass([IRAmountFactory class])
                                         code:IRInvalidAmountValue
                                     userInfo:@{NSLocalizedDescriptionKey: message}];
            return nil;
        }
    }

    return [[IRAmount alloc] initWithString:[decimalNumber stringValue]];
}

+ (nullable id<IRAmount>)amountFromUnsignedInteger:(NSUInteger)amount error:(NSError**)error {
    return [self amountFromString:[@(amount) stringValue] error:error];
}

@end
