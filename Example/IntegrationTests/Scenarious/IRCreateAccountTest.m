@import XCTest;
#import "IRBaseIrohaContainerTests.h"

@interface IRCreateAccountTest : IRBaseIrohaContainerTests

@end

@implementation IRCreateAccountTest

- (void)testCreateAccount {
    XCTAssertNotNil(self.iroha);
}

@end
