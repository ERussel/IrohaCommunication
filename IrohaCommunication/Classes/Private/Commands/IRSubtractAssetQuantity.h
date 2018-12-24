#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRSubtractAssetQuantity : NSObject<IRSubtractAssetQuantity>

- (nonnull instancetype)initWithAssetId:(nonnull id<IRAssetId>)assetId
                                   amount:(nonnull id<IRAmount>)amount;

@end
