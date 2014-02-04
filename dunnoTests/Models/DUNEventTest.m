#import <XCTest/XCTest.h>
#import "DUNEvent.h"
#import "NSDate-Utilities.h"

@interface DUNEventTest : XCTestCase

@end

@implementation DUNEventTest


- (void)test_returnTrueIfEventIsLive
{
  DUNEvent *event = [DUNEvent new];
  event.startAt = [NSDate date];
  
  XCTAssertTrue([event isLive]);
}

- (void)test_returnTrueIfEventIsClosed
{
  DUNEvent *event = [DUNEvent new];
  event.startAt = [NSDate dateYesterday];
  
  XCTAssertTrue([event isClosed]);
}

- (void)test_returnTrueIfEventIsOpenAttend
{
  DUNEvent *event = [DUNEvent new];
  event.startAt = [NSDate dateTomorrow];
  
  XCTAssertTrue([event isOpen]);
}


@end
