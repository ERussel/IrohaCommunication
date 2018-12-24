#import <Foundation/Foundation.h>
#import "IRCommand.h"

@interface IRCreateAsset : NSObject<IRCreateAsset>

- (nonnull instancetype)initWithAssetId:(nonnull id<IRAssetId>)assetId
                              precision:(UInt32)precision;

@end
