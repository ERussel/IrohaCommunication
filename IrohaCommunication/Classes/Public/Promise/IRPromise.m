#import "IRPromise.h"

@interface IRPromise()

@property(strong, nonatomic)IRPromise* _Nullable next;

@property(strong, nonatomic)IRPromiseResultHandler _Nullable resultHandler;

@property(strong, nonatomic)IRPromiseErrorHandler _Nullable errorHandler;

@property(strong, nonatomic)id _Nullable result;

@property(nonatomic, readwrite)BOOL hasResult;

@end

@implementation IRPromise

#pragma mark - Init

+ (instancetype)promise {
    return [[IRPromise alloc] init];
}

+ (instancetype)promiseWithResult:(id)result {
    IRPromise *promise = [self promise];
    [promise fulfillWithResult:result];

    return promise;
}

#pragma mark - IRPromiseProtocol

- (IRPromise* _Nonnull (^)(IRPromiseResultHandler))onThen {
    return ^(IRPromiseResultHandler block) {
        IRPromise* promise = [[IRPromise alloc] init];

        self.resultHandler = block;
        self.errorHandler = nil;

        self.next = promise;

        return promise;
    };
}

- (IRPromise* _Nonnull (^)(IRPromiseErrorHandler))onError {
    return ^(IRPromiseErrorHandler block) {
        IRPromise* promise = [[IRPromise alloc] init];

        self.resultHandler = nil;
        self.errorHandler = block;
        self.next = promise;

        return promise;
    };
}

- (void)fulfillWithResult:(id _Nullable)result {
    if (_hasResult) {
        return;
    }

    _result = result;
    _hasResult = true;

    if (_next) {
        [self triggerResultProcessing];
    }
}

- (void)triggerResultProcessing {
    if (![_result isKindOfClass:[NSError class]]) {
        if (_resultHandler) {
            IRPromise* resultPromise = _resultHandler(_result);

            if (!resultPromise) {
                return;
            }

            [resultPromise copyHandlersFromPromise:_next];

            if (resultPromise.hasResult) {
                [resultPromise triggerResultProcessing];
            }
        }
    } else {
        if (_errorHandler) {
            IRPromise *resultPromise = _errorHandler(_result);

            if (!resultPromise) {
                return;
            }

            [resultPromise copyHandlersFromPromise:_next];

            if (resultPromise.hasResult) {
                [self triggerResultProcessing];
            }

        } else {
            [_next fulfillWithResult:_result];
        }
    }
}

- (void)copyHandlersFromPromise:(IRPromise*)promise {
    [self setNext:promise.next];
    [self setResultHandler:promise.resultHandler];
    [self setErrorHandler:promise.errorHandler];
}

@end
