// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: primitive.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "Primitive.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PrimitiveRoot

@implementation PrimitiveRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - PrimitiveRoot_FileDescriptor

static GPBFileDescriptor *PrimitiveRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"iroha.protocol"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum RolePermission

GPBEnumDescriptor *RolePermission_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "CanAppendRole\000CanCreateRole\000CanDetachRol"
        "e\000CanAddAssetQty\000CanSubtractAssetQty\000Can"
        "AddPeer\000CanAddSignatory\000CanRemoveSignato"
        "ry\000CanSetQuorum\000CanCreateAccount\000CanSetD"
        "etail\000CanCreateAsset\000CanTransfer\000CanRece"
        "ive\000CanCreateDomain\000CanAddDomainAssetQty"
        "\000CanSubtractDomainAssetQty\000CanReadAssets"
        "\000CanGetRoles\000CanGetMyAccount\000CanGetAllAc"
        "counts\000CanGetDomainAccounts\000CanGetMySign"
        "atories\000CanGetAllSignatories\000CanGetDomai"
        "nSignatories\000CanGetMyAccAst\000CanGetAllAcc"
        "Ast\000CanGetDomainAccAst\000CanGetMyAccDetail"
        "\000CanGetAllAccDetail\000CanGetDomainAccDetai"
        "l\000CanGetMyAccTxs\000CanGetAllAccTxs\000CanGetD"
        "omainAccTxs\000CanGetMyAccAstTxs\000CanGetAllA"
        "ccAstTxs\000CanGetDomainAccAstTxs\000CanGetMyT"
        "xs\000CanGetAllTxs\000CanGetBlocks\000CanGrantCan"
        "SetMyQuorum\000CanGrantCanAddMySignatory\000Ca"
        "nGrantCanRemoveMySignatory\000CanGrantCanTr"
        "ansferMyAssets\000CanGrantCanSetMyAccountDe"
        "tail\000";
    static const int32_t values[] = {
        RolePermission_CanAppendRole,
        RolePermission_CanCreateRole,
        RolePermission_CanDetachRole,
        RolePermission_CanAddAssetQty,
        RolePermission_CanSubtractAssetQty,
        RolePermission_CanAddPeer,
        RolePermission_CanAddSignatory,
        RolePermission_CanRemoveSignatory,
        RolePermission_CanSetQuorum,
        RolePermission_CanCreateAccount,
        RolePermission_CanSetDetail,
        RolePermission_CanCreateAsset,
        RolePermission_CanTransfer,
        RolePermission_CanReceive,
        RolePermission_CanCreateDomain,
        RolePermission_CanAddDomainAssetQty,
        RolePermission_CanSubtractDomainAssetQty,
        RolePermission_CanReadAssets,
        RolePermission_CanGetRoles,
        RolePermission_CanGetMyAccount,
        RolePermission_CanGetAllAccounts,
        RolePermission_CanGetDomainAccounts,
        RolePermission_CanGetMySignatories,
        RolePermission_CanGetAllSignatories,
        RolePermission_CanGetDomainSignatories,
        RolePermission_CanGetMyAccAst,
        RolePermission_CanGetAllAccAst,
        RolePermission_CanGetDomainAccAst,
        RolePermission_CanGetMyAccDetail,
        RolePermission_CanGetAllAccDetail,
        RolePermission_CanGetDomainAccDetail,
        RolePermission_CanGetMyAccTxs,
        RolePermission_CanGetAllAccTxs,
        RolePermission_CanGetDomainAccTxs,
        RolePermission_CanGetMyAccAstTxs,
        RolePermission_CanGetAllAccAstTxs,
        RolePermission_CanGetDomainAccAstTxs,
        RolePermission_CanGetMyTxs,
        RolePermission_CanGetAllTxs,
        RolePermission_CanGetBlocks,
        RolePermission_CanGrantCanSetMyQuorum,
        RolePermission_CanGrantCanAddMySignatory,
        RolePermission_CanGrantCanRemoveMySignatory,
        RolePermission_CanGrantCanTransferMyAssets,
        RolePermission_CanGrantCanSetMyAccountDetail,
    };
    static const char *extraTextFormatInfo = "-\000#\246\244\000\001#\246\244\000\002#\246\244\000\003#\243\245\243\000\004#\250\245\243\000\005#\243\244\000\006#\243\251\000\007#\246\251\000\010#\243\246\000\t#\246\247\000\n#\243\246\000\013#\246\245\000\014#\250\000\r#\247\000\016#\246\246\000\017#\243\246\245\243\000\020#\250\246\245\243\000\021#\244\246\000\022#\243\245\000\023#\243\242\247\000\024#\243\243\250\000\025#\243\246\250\000\026#\243\242\253\000\027#\243\243\253\000\030#\243\246\253\000\031#\243\242\243\243\000\032#\243\243\243\243\000\033#\243\246\243\243\000\034#\243\242\243\246\000\035#\243\243\243\246\000\036#\243\246\243\246\000\037#\243\242\243\243\000 #\243\243\243\243\000!#\243\246\243\243\000\"#\243\242\243\243\243\000##\243\243\243\243\243\000$#\243\246\243\243\243\000%#\243\242\243\000&#\243\243\243\000\'#\243\246\000(#\245\243\243\242\246\000)#\245\243\243\242\251\000*#\245\243\246\242\251\000+#\245\243\250\242\246\000,#\245\243\243\242\247\246\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(RolePermission)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:RolePermission_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL RolePermission_IsValidValue(int32_t value__) {
  switch (value__) {
    case RolePermission_CanAppendRole:
    case RolePermission_CanCreateRole:
    case RolePermission_CanDetachRole:
    case RolePermission_CanAddAssetQty:
    case RolePermission_CanSubtractAssetQty:
    case RolePermission_CanAddPeer:
    case RolePermission_CanAddSignatory:
    case RolePermission_CanRemoveSignatory:
    case RolePermission_CanSetQuorum:
    case RolePermission_CanCreateAccount:
    case RolePermission_CanSetDetail:
    case RolePermission_CanCreateAsset:
    case RolePermission_CanTransfer:
    case RolePermission_CanReceive:
    case RolePermission_CanCreateDomain:
    case RolePermission_CanAddDomainAssetQty:
    case RolePermission_CanSubtractDomainAssetQty:
    case RolePermission_CanReadAssets:
    case RolePermission_CanGetRoles:
    case RolePermission_CanGetMyAccount:
    case RolePermission_CanGetAllAccounts:
    case RolePermission_CanGetDomainAccounts:
    case RolePermission_CanGetMySignatories:
    case RolePermission_CanGetAllSignatories:
    case RolePermission_CanGetDomainSignatories:
    case RolePermission_CanGetMyAccAst:
    case RolePermission_CanGetAllAccAst:
    case RolePermission_CanGetDomainAccAst:
    case RolePermission_CanGetMyAccDetail:
    case RolePermission_CanGetAllAccDetail:
    case RolePermission_CanGetDomainAccDetail:
    case RolePermission_CanGetMyAccTxs:
    case RolePermission_CanGetAllAccTxs:
    case RolePermission_CanGetDomainAccTxs:
    case RolePermission_CanGetMyAccAstTxs:
    case RolePermission_CanGetAllAccAstTxs:
    case RolePermission_CanGetDomainAccAstTxs:
    case RolePermission_CanGetMyTxs:
    case RolePermission_CanGetAllTxs:
    case RolePermission_CanGetBlocks:
    case RolePermission_CanGrantCanSetMyQuorum:
    case RolePermission_CanGrantCanAddMySignatory:
    case RolePermission_CanGrantCanRemoveMySignatory:
    case RolePermission_CanGrantCanTransferMyAssets:
    case RolePermission_CanGrantCanSetMyAccountDetail:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum GrantablePermission

GPBEnumDescriptor *GrantablePermission_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "CanAddMySignatory\000CanRemoveMySignatory\000C"
        "anSetMyQuorum\000CanSetMyAccountDetail\000CanT"
        "ransferMyAssets\000";
    static const int32_t values[] = {
        GrantablePermission_CanAddMySignatory,
        GrantablePermission_CanRemoveMySignatory,
        GrantablePermission_CanSetMyQuorum,
        GrantablePermission_CanSetMyAccountDetail,
        GrantablePermission_CanTransferMyAssets,
    };
    static const char *extraTextFormatInfo = "\005\000#\243\242\251\000\001#\246\242\251\000\002#\243\242\246\000\003#\243\242\247\246\000\004#\250\242\246\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(GrantablePermission)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:GrantablePermission_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL GrantablePermission_IsValidValue(int32_t value__) {
  switch (value__) {
    case GrantablePermission_CanAddMySignatory:
    case GrantablePermission_CanRemoveMySignatory:
    case GrantablePermission_CanSetMyQuorum:
    case GrantablePermission_CanSetMyAccountDetail:
    case GrantablePermission_CanTransferMyAssets:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Signature

@implementation Signature

@dynamic publicKey;
@dynamic signature;

typedef struct Signature__storage_ {
  uint32_t _has_storage_[1];
  NSData *publicKey;
  NSData *signature;
} Signature__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "publicKey",
        .dataTypeSpecific.className = NULL,
        .number = Signature_FieldNumber_PublicKey,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Signature__storage_, publicKey),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "signature",
        .dataTypeSpecific.className = NULL,
        .number = Signature_FieldNumber_Signature,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Signature__storage_, signature),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Signature class]
                                     rootClass:[PrimitiveRoot class]
                                          file:PrimitiveRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Signature__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - Peer

@implementation Peer

@dynamic address;
@dynamic peerKey;

typedef struct Peer__storage_ {
  uint32_t _has_storage_[1];
  NSString *address;
  NSData *peerKey;
} Peer__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "address",
        .dataTypeSpecific.className = NULL,
        .number = Peer_FieldNumber_Address,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Peer__storage_, address),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "peerKey",
        .dataTypeSpecific.className = NULL,
        .number = Peer_FieldNumber_PeerKey,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Peer__storage_, peerKey),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Peer class]
                                     rootClass:[PrimitiveRoot class]
                                          file:PrimitiveRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Peer__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
