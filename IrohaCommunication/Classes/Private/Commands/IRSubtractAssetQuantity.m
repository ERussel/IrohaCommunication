#import "IRSubtractAssetQuantity.h"

@implementation IRSubtractAssetQuantity
@synthesize assetId = _assetId;
@synthesize amount = _amount;

- (nonnull instancetype)initWithAssetId:(nonnull id<IRAssetId>)assetId
                                 amount:(nonnull id<IRAmount>)amount {

    if (self = [super init]) {
        _assetId = assetId;
        _amount = amount;
    }

    return self;
}

@end
