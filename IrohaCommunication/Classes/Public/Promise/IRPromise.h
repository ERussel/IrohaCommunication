#import <Foundation/Foundation.h>

@class IRPromise;

typedef IRPromise* _Nullable (^IRPromiseResultHandler)(id _Nullable);
typedef IRPromise* _Nullable (^IRPromiseErrorHandler)(NSError* _Nonnull);

@interface IRPromise : NSObject

+ (instancetype)promise;
+ (instancetype)promiseWithResult:(id)result;

- (IRPromise* _Nonnull (^)(IRPromiseResultHandler))onThen;
- (IRPromise* _Nonnull (^)(IRPromiseErrorHandler))onError;

- (void)fulfillWithResult:(id _Nullable)result;

@end
