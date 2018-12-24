#import "IRCreateAsset.h"

@implementation IRCreateAsset
@synthesize assetId = _assetId;
@synthesize precision = _precision;

- (nonnull instancetype)initWithAssetId:(nonnull id<IRAssetId>)assetId
                              precision:(UInt32)precision {

    if (self = [super init]) {
        _assetId = assetId;
        _precision = precision;
    }

    return self;
}

@end
