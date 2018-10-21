// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: block.proto

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

@class Block_Payload;
@class Signature;
@class Transaction;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - BlockRoot

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
@interface BlockRoot : GPBRootObject
@end

#pragma mark - Block

typedef GPB_ENUM(Block_FieldNumber) {
  Block_FieldNumber_Payload = 1,
  Block_FieldNumber_SignaturesArray = 2,
};

@interface Block : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) Block_Payload *payload;
/** Test to see if @c payload has been set. */
@property(nonatomic, readwrite) BOOL hasPayload;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<Signature*> *signaturesArray;
/** The number of items in @c signaturesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger signaturesArray_Count;

@end

#pragma mark - Block_Payload

typedef GPB_ENUM(Block_Payload_FieldNumber) {
  Block_Payload_FieldNumber_TransactionsArray = 1,
  Block_Payload_FieldNumber_TxNumber = 2,
  Block_Payload_FieldNumber_Height = 3,
  Block_Payload_FieldNumber_PrevBlockHash = 5,
  Block_Payload_FieldNumber_CreatedTime = 6,
};

/**
 * everything that should be signed:
 **/
@interface Block_Payload : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<Transaction*> *transactionsArray;
/** The number of items in @c transactionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger transactionsArray_Count;

/** the number of transactions inside. Maximum 16384 or 2^14 */
@property(nonatomic, readwrite) uint32_t txNumber;

/** the current block number in a ledger */
@property(nonatomic, readwrite) uint64_t height;

/** Previous block hash */
@property(nonatomic, readwrite, copy, null_resettable) NSData *prevBlockHash;

@property(nonatomic, readwrite) uint64_t createdTime;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)