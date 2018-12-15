#import "IRRolePermission.h"
#import "Primitive.pbobjc.h"

@interface IRRolePermission : NSObject<IRRolePermission>

- (instancetype)initWithPermission:(RolePermission)permission;

@end

@implementation IRRolePermission
@synthesize value = _value;

- (instancetype)initWithPermission:(RolePermission)permission {
    if (self = [super init]) {
        _value = permission;
    }

    return self;
}

- (NSUInteger)hash {
    return (NSUInteger)_value;
}

- (BOOL)isEqual:(id)object {
    if (![object conformsToProtocol:@protocol(IRRolePermission)]) {
        return false;
    }

    return _value == [(id<IRRolePermission>)object value];
}

@end

@implementation IRRolePermissionFactory

+ (nullable id<IRRolePermission>)permissionWithValue:(int32_t)value {
    if (!RolePermission_IsValidValue(value)) {
        return nil;
    }

    return [[IRRolePermission alloc] initWithPermission:value];
}

#pragma mark - Command Permissions

+ (id<IRRolePermission>)canAppendRole {
    return [self permissionWithValue:RolePermission_CanAppendRole];
}

+ (id<IRRolePermission>)canCreateRole {
    return [self permissionWithValue:RolePermission_CanCreateRole];
}

+ (id<IRRolePermission>)canDetachRole {
    return [self permissionWithValue:RolePermission_CanDetachRole];
}

+ (id<IRRolePermission>)canAddAssetQuantity {
    return [self permissionWithValue:RolePermission_CanAddAssetQty];
}

+ (id<IRRolePermission>)canSubtractAssetQuantity {
    return [self permissionWithValue:RolePermission_CanSubtractAssetQty];
}

+ (id<IRRolePermission>)canAddPeer {
    return [self permissionWithValue:RolePermission_CanAddPeer];
}

+ (id<IRRolePermission>)canAddSignatory {
    return [self permissionWithValue:RolePermission_CanAddSignatory];
}

+ (id<IRRolePermission>)canRemoveSignatory {
    return [self permissionWithValue:RolePermission_CanRemoveSignatory];
}

+ (id<IRRolePermission>)canSetQuorum {
    return [self permissionWithValue:RolePermission_CanSetQuorum];
}

+ (id<IRRolePermission>)canCreateAccount {
    return [self permissionWithValue:RolePermission_CanCreateAccount];
}

+ (id<IRRolePermission>)canSetDetail {
    return [self permissionWithValue:RolePermission_CanSetDetail];
}

+ (id<IRRolePermission>)canCreateAsset {
    return [self permissionWithValue:RolePermission_CanCreateAsset];
}

+ (id<IRRolePermission>)canTransfer {
    return [self permissionWithValue:RolePermission_CanTransfer];
}

+ (id<IRRolePermission>)canReceive {
    return [self permissionWithValue:RolePermission_CanReceive];
}

+ (id<IRRolePermission>)canCreateDomain {
    return [self permissionWithValue:RolePermission_CanCreateDomain];
}

+ (id<IRRolePermission>)canAddDomainAssetQuantity {
    return [self permissionWithValue:RolePermission_CanAddDomainAssetQty];
}

+ (id<IRRolePermission>)canSubtractDomainAssetQuantity {
    return [self permissionWithValue:RolePermission_CanSubtractDomainAssetQty];
}

#pragma mark - Query permissions

+ (id<IRRolePermission>)canReadAssets {
    return [self permissionWithValue:RolePermission_CanReadAssets];
}

+ (id<IRRolePermission>)canGetRoles {
    return [self permissionWithValue:RolePermission_CanGetRoles];
}

+ (id<IRRolePermission>)canGetMyAccount {
    return [self permissionWithValue:RolePermission_CanGetMyAccount];
}

+ (id<IRRolePermission>)canGetAllAccounts {
    return [self permissionWithValue:RolePermission_CanGetAllAccounts];
}

+ (id<IRRolePermission>)canGetDomainAccounts {
    return [self permissionWithValue:RolePermission_CanGetDomainAccounts];
}

+ (id<IRRolePermission>)canGetMySignatories {
    return [self permissionWithValue:RolePermission_CanGetMySignatories];
}

+ (id<IRRolePermission>)canGetAllSignatories {
    return [self permissionWithValue:RolePermission_CanGetAllSignatories];
}

+ (id<IRRolePermission>)canGetDomainSignatories {
    return [self permissionWithValue:RolePermission_CanGetDomainSignatories];
}

+ (id<IRRolePermission>)canGetMyAccountAssets {
    return [self permissionWithValue:RolePermission_CanGetMyAccAst];
}

+ (id<IRRolePermission>)canGetAllAccountAssets {
    return [self permissionWithValue:RolePermission_CanGetAllAccAst];
}

+ (id<IRRolePermission>)canGetDomainAccountAssets {
    return [self permissionWithValue:RolePermission_CanGetDomainAccAst];
}

+ (id<IRRolePermission>)canGetMyAccountDetail {
    return [self permissionWithValue:RolePermission_CanGetMyAccDetail];
}

+ (id<IRRolePermission>)canGetAllAccountDetail {
    return [self permissionWithValue:RolePermission_CanGetAllAccDetail];
}

+ (id<IRRolePermission>)canGetDomainAccountDetail {
    return [self permissionWithValue:RolePermission_CanGetDomainAccDetail];
}

+ (id<IRRolePermission>)canGetMyAccountTransactions {
    return [self permissionWithValue:RolePermission_CanGetMyAccTxs];
}

+ (id<IRRolePermission>)canGetAllAccountTransactions {
    return [self permissionWithValue:RolePermission_CanGetAllAccTxs];
}

+ (id<IRRolePermission>)canGetDomainAccountTransactions {
    return [self permissionWithValue:RolePermission_CanGetDomainAccTxs];
}

+ (id<IRRolePermission>)canGetMyAccountAssetTransactions {
    return [self permissionWithValue:RolePermission_CanGetMyAccAstTxs];
}

+ (id<IRRolePermission>)canGetAllAccountAssetTransactions {
    return [self permissionWithValue:RolePermission_CanGetAllAccAstTxs];
}

+ (id<IRRolePermission>)canGetDomainAccountAsssetTransactions {
    return [self permissionWithValue:RolePermission_CanGetDomainAccAstTxs];
}

+ (id<IRRolePermission>)canGetMyTransactions {
    return [self permissionWithValue:RolePermission_CanGetMyTxs];
}

+ (id<IRRolePermission>)canGetAllTransactions {
    return [self permissionWithValue:RolePermission_CanGetAllTxs];
}

+ (id<IRRolePermission>)canGetBlocks {
    return [self permissionWithValue:RolePermission_CanGetBlocks];
}

#pragma mark - Grant permissions

+ (id<IRRolePermission>)canGrantCanSetMyQuorum {
    return [self permissionWithValue:RolePermission_CanGrantCanSetMyQuorum];
}

+ (id<IRRolePermission>)canGrantCanAddMySignatory {
    return [self permissionWithValue:RolePermission_CanGrantCanAddMySignatory];
}

+ (id<IRRolePermission>)canGrantCanRemoveMySignatory {
    return [self permissionWithValue:RolePermission_CanGrantCanRemoveMySignatory];
}

+ (id<IRRolePermission>)canGrantCanTransferMyAssets {
    return [self permissionWithValue:RolePermission_CanGrantCanTransferMyAssets];
}

+ (id<IRRolePermission>)canGrantCanSetMyAccountDetail {
    return [self permissionWithValue:RolePermission_CanGrantCanSetMyAccountDetail];
}

@end
