#import <XCTest/XCTest.h>

#import "DUNTimelineInteraction.h"

#import "DUNTimelineUserMessage.h"
#import "DUNTimelinePoll.h"
#import "DUNTimelineRating.h"

@interface DUNTimelineInteractionTest : XCTestCase

@end

@implementation DUNTimelineInteractionTest


- (void)testTypeReturnDUNTimelineInteractionMessage
{
  XCTAssert([DUNTimelineUserMessage new].type == DUNTimelineInteractionMessage);
}

- (void)testTypeReturnDUNTimelineInteractionPoll
{
  XCTAssert([DUNTimelinePoll new].type == DUNTimelineInteractionPoll);
}

- (void)testTypeReturnDUNTimelineInteractionRating
{
  XCTAssert([DUNTimelineRating new].type == DUNTimelineInteractionRating);
}
@end
