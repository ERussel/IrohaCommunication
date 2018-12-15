#import <Foundation/Foundation.h>

@protocol IRGrantablePermission <NSObject>

@property(nonatomic, readonly)int32_t value;

@end

@protocol IRGrantablePermissionFactoryProtocol <NSObject>

+ (nullable id<IRGrantablePermission>)permissionWithValue:(int32_t)value;

@end

@interface IRGrantablePermissionFactory : NSObject<IRGrantablePermissionFactoryProtocol>

+ (nonnull id<IRGrantablePermission>)canAddMySignatory;
+ (nonnull id<IRGrantablePermission>)canRemoveMySignatory;
+ (nonnull id<IRGrantablePermission>)canSetMyQuorum;
+ (nonnull id<IRGrantablePermission>)canSetMyAccountDetail;

@end
