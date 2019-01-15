#import "IRBaseIrohaContainerTests.h"
#import "IRIrohaContainer.h"

static NSString * IROHA_IP = @"127.0.0.1";
static NSString * IROHA_PORT = @"50051";

@implementation IRBaseIrohaContainerTests

- (void)setUp {
    [super setUp];

    NSError *error = nil;
    error = [IRIrohaContainer.shared start];

    if (error) {
        NSLog(@"%@", error);
        return;
    }

    id<IRAddress> irohaAddress = [IRAddressFactory addressWithIp:IROHA_IP
                                                            port:IROHA_PORT
                                                           error:&error];

    _iroha = [[IRNetworkService alloc] initWithAddress:irohaAddress];
}

- (void)tearDown {
    [super tearDown];

    NSError *error = nil;
    error = [IRIrohaContainer.shared stop];

    if (error) {
        NSLog(@"%@", error);
    }

    _iroha = nil;
}

@end
