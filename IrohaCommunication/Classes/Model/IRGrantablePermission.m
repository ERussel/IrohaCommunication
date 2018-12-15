#import "IRGrantablePermission.h"
#import "Primitive.pbobjc.h"

@interface IRGrantablePermission : NSObject<IRGrantablePermission>

- (instancetype)initWithPermission:(GrantablePermission)permission;

@end

@implementation IRGrantablePermission
@synthesize value = _value;

- (instancetype)initWithPermission:(GrantablePermission)permission {
    if (self = [super init]) {
        _value = permission;
    }

    return self;
}

- (NSUInteger)hash {
    return (NSUInteger)_value;
}

- (BOOL)isEqual:(id)object {
    if (![object conformsToProtocol:@protocol(IRGrantablePermission)]) {
        return false;
    }

    return _value == [(id<IRGrantablePermission>)object value];
}

@end

@implementation IRGrantablePermissionFactory

+ (nullable id<IRGrantablePermission>)permissionWithValue:(int32_t)value {
    if (!GrantablePermission_IsValidValue(value)) {
        return nil;
    }

    return [[IRGrantablePermission alloc] initWithPermission:value];
}

+ (nonnull id<IRGrantablePermission>)canAddMySignatory {
    return [self permissionWithValue:GrantablePermission_CanAddMySignatory];
}

+ (nonnull id<IRGrantablePermission>)canRemoveMySignatory {
    return [self permissionWithValue:GrantablePermission_CanRemoveMySignatory];
}

+ (nonnull id<IRGrantablePermission>)canSetMyQuorum {
    return [self permissionWithValue:GrantablePermission_CanSetMyQuorum];
}

+ (nonnull id<IRGrantablePermission>)canSetMyAccountDetail {
    return [self permissionWithValue:GrantablePermission_CanSetMyAccountDetail];
}

@end
