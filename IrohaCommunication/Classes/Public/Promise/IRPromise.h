#import <Foundation/Foundation.h>

@class IRPromise;

typedef IRPromise* _Nullable (^IRPromiseResultHandler)(id _Nullable);
typedef IRPromise* _Nullable (^IRPromiseErrorHandler)(NSError* _Nonnull);

@interface IRPromise : NSObject

@property(nonatomic, readonly)BOOL isFulfilled;
@property(nonatomic, readonly)BOOL isProcessed;

@property(nonatomic, readonly)id _Nullable result;

+ (instancetype)promise;
+ (instancetype)promiseWithResult:(id)result;

- (IRPromise* _Nonnull (^)(IRPromiseResultHandler))onThen;
- (IRPromise* _Nonnull (^)(IRPromiseErrorHandler))onError;

- (void)fulfillWithResult:(id _Nullable)result;

@end
