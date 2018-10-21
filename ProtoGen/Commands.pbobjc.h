// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: commands.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class AddAssetQuantity;
@class AddPeer;
@class AddSignatory;
@class AppendRole;
@class CreateAccount;
@class CreateAsset;
@class CreateDomain;
@class CreateRole;
@class DetachRole;
@class GrantPermission;
@class Peer;
@class RemoveSignatory;
@class RevokePermission;
@class SetAccountDetail;
@class SetAccountQuorum;
@class SubtractAssetQuantity;
@class TransferAsset;
GPB_ENUM_FWD_DECLARE(GrantablePermission);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - CommandsRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface CommandsRoot : GPBRootObject
@end

#pragma mark - AddAssetQuantity

typedef GPB_ENUM(AddAssetQuantity_FieldNumber) {
  AddAssetQuantity_FieldNumber_AssetId = 1,
  AddAssetQuantity_FieldNumber_Amount = 2,
};

@interface AddAssetQuantity : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *assetId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *amount;

@end

#pragma mark - AddPeer

typedef GPB_ENUM(AddPeer_FieldNumber) {
  AddPeer_FieldNumber_Peer = 1,
};

@interface AddPeer : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) Peer *peer;
/** Test to see if @c peer has been set. */
@property(nonatomic, readwrite) BOOL hasPeer;

@end

#pragma mark - AddSignatory

typedef GPB_ENUM(AddSignatory_FieldNumber) {
  AddSignatory_FieldNumber_AccountId = 1,
  AddSignatory_FieldNumber_PublicKey = 2,
};

@interface AddSignatory : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite, copy, null_resettable) NSData *publicKey;

@end

#pragma mark - CreateAsset

typedef GPB_ENUM(CreateAsset_FieldNumber) {
  CreateAsset_FieldNumber_AssetName = 1,
  CreateAsset_FieldNumber_DomainId = 2,
  CreateAsset_FieldNumber_Precision = 3,
};

@interface CreateAsset : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *assetName;

@property(nonatomic, readwrite, copy, null_resettable) NSString *domainId;

@property(nonatomic, readwrite) uint32_t precision;

@end

#pragma mark - CreateAccount

typedef GPB_ENUM(CreateAccount_FieldNumber) {
  CreateAccount_FieldNumber_AccountName = 1,
  CreateAccount_FieldNumber_DomainId = 2,
  CreateAccount_FieldNumber_PublicKey = 3,
};

@interface CreateAccount : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountName;

@property(nonatomic, readwrite, copy, null_resettable) NSString *domainId;

@property(nonatomic, readwrite, copy, null_resettable) NSData *publicKey;

@end

#pragma mark - SetAccountDetail

typedef GPB_ENUM(SetAccountDetail_FieldNumber) {
  SetAccountDetail_FieldNumber_AccountId = 1,
  SetAccountDetail_FieldNumber_Key = 2,
  SetAccountDetail_FieldNumber_Value = 3,
};

@interface SetAccountDetail : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *key;

@property(nonatomic, readwrite, copy, null_resettable) NSString *value;

@end

#pragma mark - CreateDomain

typedef GPB_ENUM(CreateDomain_FieldNumber) {
  CreateDomain_FieldNumber_DomainId = 1,
  CreateDomain_FieldNumber_DefaultRole = 2,
};

@interface CreateDomain : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *domainId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *defaultRole;

@end

#pragma mark - RemoveSignatory

typedef GPB_ENUM(RemoveSignatory_FieldNumber) {
  RemoveSignatory_FieldNumber_AccountId = 1,
  RemoveSignatory_FieldNumber_PublicKey = 2,
};

@interface RemoveSignatory : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite, copy, null_resettable) NSData *publicKey;

@end

#pragma mark - SetAccountQuorum

typedef GPB_ENUM(SetAccountQuorum_FieldNumber) {
  SetAccountQuorum_FieldNumber_AccountId = 1,
  SetAccountQuorum_FieldNumber_Quorum = 2,
};

@interface SetAccountQuorum : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite) uint32_t quorum;

@end

#pragma mark - TransferAsset

typedef GPB_ENUM(TransferAsset_FieldNumber) {
  TransferAsset_FieldNumber_SrcAccountId = 1,
  TransferAsset_FieldNumber_DestAccountId = 2,
  TransferAsset_FieldNumber_AssetId = 3,
  TransferAsset_FieldNumber_Description_p = 4,
  TransferAsset_FieldNumber_Amount = 5,
};

@interface TransferAsset : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *srcAccountId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *destAccountId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *assetId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *description_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *amount;

@end

#pragma mark - AppendRole

typedef GPB_ENUM(AppendRole_FieldNumber) {
  AppendRole_FieldNumber_AccountId = 1,
  AppendRole_FieldNumber_RoleName = 2,
};

@interface AppendRole : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *roleName;

@end

#pragma mark - DetachRole

typedef GPB_ENUM(DetachRole_FieldNumber) {
  DetachRole_FieldNumber_AccountId = 1,
  DetachRole_FieldNumber_RoleName = 2,
};

@interface DetachRole : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *roleName;

@end

#pragma mark - CreateRole

typedef GPB_ENUM(CreateRole_FieldNumber) {
  CreateRole_FieldNumber_RoleName = 1,
  CreateRole_FieldNumber_PermissionsArray = 2,
};

@interface CreateRole : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *roleName;

// |permissionsArray| contains |RolePermission|
@property(nonatomic, readwrite, strong, null_resettable) GPBEnumArray *permissionsArray;
/** The number of items in @c permissionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger permissionsArray_Count;

@end

#pragma mark - GrantPermission

typedef GPB_ENUM(GrantPermission_FieldNumber) {
  GrantPermission_FieldNumber_AccountId = 1,
  GrantPermission_FieldNumber_Permission = 2,
};

@interface GrantPermission : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite) enum GrantablePermission permission;

@end

/**
 * Fetches the raw value of a @c GrantPermission's @c permission property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t GrantPermission_Permission_RawValue(GrantPermission *message);
/**
 * Sets the raw value of an @c GrantPermission's @c permission property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetGrantPermission_Permission_RawValue(GrantPermission *message, int32_t value);

#pragma mark - RevokePermission

typedef GPB_ENUM(RevokePermission_FieldNumber) {
  RevokePermission_FieldNumber_AccountId = 1,
  RevokePermission_FieldNumber_Permission = 2,
};

@interface RevokePermission : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *accountId;

@property(nonatomic, readwrite) enum GrantablePermission permission;

@end

/**
 * Fetches the raw value of a @c RevokePermission's @c permission property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t RevokePermission_Permission_RawValue(RevokePermission *message);
/**
 * Sets the raw value of an @c RevokePermission's @c permission property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetRevokePermission_Permission_RawValue(RevokePermission *message, int32_t value);

#pragma mark - SubtractAssetQuantity

typedef GPB_ENUM(SubtractAssetQuantity_FieldNumber) {
  SubtractAssetQuantity_FieldNumber_AssetId = 1,
  SubtractAssetQuantity_FieldNumber_Amount = 2,
};

@interface SubtractAssetQuantity : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *assetId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *amount;

@end

#pragma mark - Command

typedef GPB_ENUM(Command_FieldNumber) {
  Command_FieldNumber_AddAssetQuantity = 1,
  Command_FieldNumber_AddPeer = 2,
  Command_FieldNumber_AddSignatory = 3,
  Command_FieldNumber_AppendRole = 4,
  Command_FieldNumber_CreateAccount = 5,
  Command_FieldNumber_CreateAsset = 6,
  Command_FieldNumber_CreateDomain = 7,
  Command_FieldNumber_CreateRole = 8,
  Command_FieldNumber_DetachRole = 9,
  Command_FieldNumber_GrantPermission = 10,
  Command_FieldNumber_RemoveSignatory = 11,
  Command_FieldNumber_RevokePermission = 12,
  Command_FieldNumber_SetAccountDetail = 13,
  Command_FieldNumber_SetAccountQuorum = 14,
  Command_FieldNumber_SubtractAssetQuantity = 15,
  Command_FieldNumber_TransferAsset = 16,
};

typedef GPB_ENUM(Command_Command_OneOfCase) {
  Command_Command_OneOfCase_GPBUnsetOneOfCase = 0,
  Command_Command_OneOfCase_AddAssetQuantity = 1,
  Command_Command_OneOfCase_AddPeer = 2,
  Command_Command_OneOfCase_AddSignatory = 3,
  Command_Command_OneOfCase_AppendRole = 4,
  Command_Command_OneOfCase_CreateAccount = 5,
  Command_Command_OneOfCase_CreateAsset = 6,
  Command_Command_OneOfCase_CreateDomain = 7,
  Command_Command_OneOfCase_CreateRole = 8,
  Command_Command_OneOfCase_DetachRole = 9,
  Command_Command_OneOfCase_GrantPermission = 10,
  Command_Command_OneOfCase_RemoveSignatory = 11,
  Command_Command_OneOfCase_RevokePermission = 12,
  Command_Command_OneOfCase_SetAccountDetail = 13,
  Command_Command_OneOfCase_SetAccountQuorum = 14,
  Command_Command_OneOfCase_SubtractAssetQuantity = 15,
  Command_Command_OneOfCase_TransferAsset = 16,
};

@interface Command : GPBMessage

@property(nonatomic, readonly) Command_Command_OneOfCase commandOneOfCase;

@property(nonatomic, readwrite, strong, null_resettable) AddAssetQuantity *addAssetQuantity;

@property(nonatomic, readwrite, strong, null_resettable) AddPeer *addPeer;

@property(nonatomic, readwrite, strong, null_resettable) AddSignatory *addSignatory;

@property(nonatomic, readwrite, strong, null_resettable) AppendRole *appendRole;

@property(nonatomic, readwrite, strong, null_resettable) CreateAccount *createAccount;

@property(nonatomic, readwrite, strong, null_resettable) CreateAsset *createAsset;

@property(nonatomic, readwrite, strong, null_resettable) CreateDomain *createDomain;

@property(nonatomic, readwrite, strong, null_resettable) CreateRole *createRole;

@property(nonatomic, readwrite, strong, null_resettable) DetachRole *detachRole;

@property(nonatomic, readwrite, strong, null_resettable) GrantPermission *grantPermission;

@property(nonatomic, readwrite, strong, null_resettable) RemoveSignatory *removeSignatory;

@property(nonatomic, readwrite, strong, null_resettable) RevokePermission *revokePermission;

@property(nonatomic, readwrite, strong, null_resettable) SetAccountDetail *setAccountDetail;

@property(nonatomic, readwrite, strong, null_resettable) SetAccountQuorum *setAccountQuorum;

@property(nonatomic, readwrite, strong, null_resettable) SubtractAssetQuantity *subtractAssetQuantity;

@property(nonatomic, readwrite, strong, null_resettable) TransferAsset *transferAsset;

@end

/**
 * Clears whatever value was set for the oneof 'command'.
 **/
void Command_ClearCommandOneOfCase(Command *message);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
