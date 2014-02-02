#import <XCTest/XCTest.h>
#import "DUNTimeline.h"
#import "DUNTimelinePoll.h"
#import "DUNTimelineRating.h"
#import "DUNTimelineUserMessage.h"

@interface DUNTimelineTest : XCTestCase

@property (nonatomic, strong) DUNTimeline *timeline;
@end

@implementation DUNTimelineTest

- (void)setUp
{
    [super setUp];
  
    _timeline = [DUNTimeline new];
}

- (void)testThrowExceptionIfParamIsNil
{  
  XCTAssertThrows([_timeline addInteraction:nil]);
}

- (void)testAddUserMessageInteraction
{
  [_timeline addInteraction:[DUNTimelineUserMessage new]];
    XCTAssertTrue(_timeline.interactions.count==1);
}

- (void)testAddPollInteraction
{
  [_timeline addInteraction:[DUNTimelinePoll new]];
  XCTAssertTrue(_timeline.interactions.count==1);
}

- (void)testAddRatingInteraction
{
  [_timeline addInteraction:[DUNTimelineRating new]];
  XCTAssertTrue(_timeline.interactions.count==1);
}

@end
