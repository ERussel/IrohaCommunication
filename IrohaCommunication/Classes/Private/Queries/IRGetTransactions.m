#import "IRGetTransactions.h"
#import "Queries.pbobjc.h"

@implementation IRGetTransactions
@synthesize transactionHashes = _transactionHashes;

- (nonnull instancetype)initWithTransactionHashes:(nonnull NSArray<NSData*> *)hashes {
    if (self = [super init]) {
        _transactionHashes = hashes;
    }

    return self;
}

#pragma mark - Protobuf Transformable

- (nullable id)transform:(NSError**)error {
    GetTransactions *query = [[GetTransactions alloc] init];
    query.txHashesArray = [_transactionHashes mutableCopy];

    Query_Payload *payload = [[Query_Payload alloc] init];
    payload.getTransactions = query;

    return payload;
}

@end
