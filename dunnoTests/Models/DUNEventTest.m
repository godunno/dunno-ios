#import <XCTest/XCTest.h>
#import "DUNEvent.h"
#import "NSDate-Utilities.h"

@interface DUNEventTest : XCTestCase

@end

@implementation DUNEventTest


- (void)test_defaultStatusIsDUNEventAvailable
{
  DUNEvent *event = [DUNEvent new];
  XCTAssertTrue(event.status == DUNEventAvailable);
}


@end
