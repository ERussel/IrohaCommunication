// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: transaction.proto

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

 #import "Transaction.pbobjc.h"
 #import "Commands.pbobjc.h"
 #import "Primitive.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"

#pragma mark - TransactionRoot

@implementation TransactionRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - TransactionRoot_FileDescriptor

static GPBFileDescriptor *TransactionRoot_FileDescriptor(void) {
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

#pragma mark - Transaction

@implementation Transaction

@dynamic hasPayload, payload;
@dynamic signaturesArray, signaturesArray_Count;

typedef struct Transaction__storage_ {
  uint32_t _has_storage_[1];
  Transaction_Payload *payload;
  NSMutableArray *signaturesArray;
} Transaction__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "payload",
        .dataTypeSpecific.className = GPBStringifySymbol(Transaction_Payload),
        .number = Transaction_FieldNumber_Payload,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Transaction__storage_, payload),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "signaturesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Signature),
        .number = Transaction_FieldNumber_SignaturesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Transaction__storage_, signaturesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Transaction class]
                                     rootClass:[TransactionRoot class]
                                          file:TransactionRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Transaction__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - Transaction_Payload

@implementation Transaction_Payload

@dynamic optionalBatchMetaOneOfCase;
@dynamic hasReducedPayload, reducedPayload;
@dynamic batch;

typedef struct Transaction_Payload__storage_ {
  uint32_t _has_storage_[2];
  Transaction_Payload_ReducedPayload *reducedPayload;
  Transaction_Payload_BatchMeta *batch;
} Transaction_Payload__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "reducedPayload",
        .dataTypeSpecific.className = GPBStringifySymbol(Transaction_Payload_ReducedPayload),
        .number = Transaction_Payload_FieldNumber_ReducedPayload,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Transaction_Payload__storage_, reducedPayload),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "batch",
        .dataTypeSpecific.className = GPBStringifySymbol(Transaction_Payload_BatchMeta),
        .number = Transaction_Payload_FieldNumber_Batch,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(Transaction_Payload__storage_, batch),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Transaction_Payload class]
                                     rootClass:[TransactionRoot class]
                                          file:TransactionRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Transaction_Payload__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    static const char *oneofs[] = {
      "optionalBatchMeta",
    };
    [localDescriptor setupOneofs:oneofs
                           count:(uint32_t)(sizeof(oneofs) / sizeof(char*))
                   firstHasIndex:-1];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(Transaction)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

void Transaction_Payload_ClearOptionalBatchMetaOneOfCase(Transaction_Payload *message) {
  GPBDescriptor *descriptor = [message descriptor];
  GPBOneofDescriptor *oneof = [descriptor.oneofs objectAtIndex:0];
  GPBMaybeClearOneof(message, oneof, -1, 0);
}
#pragma mark - Transaction_Payload_BatchMeta

@implementation Transaction_Payload_BatchMeta

@dynamic type;
@dynamic reducedHashesArray, reducedHashesArray_Count;

typedef struct Transaction_Payload_BatchMeta__storage_ {
  uint32_t _has_storage_[1];
  Transaction_Payload_BatchMeta_BatchType type;
  NSMutableArray *reducedHashesArray;
} Transaction_Payload_BatchMeta__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = Transaction_Payload_BatchMeta_BatchType_EnumDescriptor,
        .number = Transaction_Payload_BatchMeta_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Transaction_Payload_BatchMeta__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "reducedHashesArray",
        .dataTypeSpecific.className = NULL,
        .number = Transaction_Payload_BatchMeta_FieldNumber_ReducedHashesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Transaction_Payload_BatchMeta__storage_, reducedHashesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Transaction_Payload_BatchMeta class]
                                     rootClass:[TransactionRoot class]
                                          file:TransactionRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Transaction_Payload_BatchMeta__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(Transaction_Payload)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t Transaction_Payload_BatchMeta_Type_RawValue(Transaction_Payload_BatchMeta *message) {
  GPBDescriptor *descriptor = [Transaction_Payload_BatchMeta descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:Transaction_Payload_BatchMeta_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetTransaction_Payload_BatchMeta_Type_RawValue(Transaction_Payload_BatchMeta *message, int32_t value) {
  GPBDescriptor *descriptor = [Transaction_Payload_BatchMeta descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:Transaction_Payload_BatchMeta_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum Transaction_Payload_BatchMeta_BatchType

GPBEnumDescriptor *Transaction_Payload_BatchMeta_BatchType_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "Atomic\000Ordered\000";
    static const int32_t values[] = {
        Transaction_Payload_BatchMeta_BatchType_Atomic,
        Transaction_Payload_BatchMeta_BatchType_Ordered,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(Transaction_Payload_BatchMeta_BatchType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:Transaction_Payload_BatchMeta_BatchType_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL Transaction_Payload_BatchMeta_BatchType_IsValidValue(int32_t value__) {
  switch (value__) {
    case Transaction_Payload_BatchMeta_BatchType_Atomic:
    case Transaction_Payload_BatchMeta_BatchType_Ordered:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Transaction_Payload_ReducedPayload

@implementation Transaction_Payload_ReducedPayload

@dynamic commandsArray, commandsArray_Count;
@dynamic creatorAccountId;
@dynamic createdTime;
@dynamic quorum;

typedef struct Transaction_Payload_ReducedPayload__storage_ {
  uint32_t _has_storage_[1];
  uint32_t quorum;
  NSMutableArray *commandsArray;
  NSString *creatorAccountId;
  uint64_t createdTime;
} Transaction_Payload_ReducedPayload__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "commandsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(Command),
        .number = Transaction_Payload_ReducedPayload_FieldNumber_CommandsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(Transaction_Payload_ReducedPayload__storage_, commandsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "creatorAccountId",
        .dataTypeSpecific.className = NULL,
        .number = Transaction_Payload_ReducedPayload_FieldNumber_CreatorAccountId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(Transaction_Payload_ReducedPayload__storage_, creatorAccountId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "createdTime",
        .dataTypeSpecific.className = NULL,
        .number = Transaction_Payload_ReducedPayload_FieldNumber_CreatedTime,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(Transaction_Payload_ReducedPayload__storage_, createdTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt64,
      },
      {
        .name = "quorum",
        .dataTypeSpecific.className = NULL,
        .number = Transaction_Payload_ReducedPayload_FieldNumber_Quorum,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(Transaction_Payload_ReducedPayload__storage_, quorum),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[Transaction_Payload_ReducedPayload class]
                                     rootClass:[TransactionRoot class]
                                          file:TransactionRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(Transaction_Payload_ReducedPayload__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(Transaction_Payload)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
