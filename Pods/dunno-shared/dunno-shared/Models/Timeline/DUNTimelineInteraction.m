#import "DUNTimelineInteraction.h"
#import "DUNTimelineUserMessage.h"
#import "DUNTimelinePoll.h"
#import "DUNTimelineRating.h"

@implementation DUNTimelineInteraction

- (DUNTimelineInteractionType) type
{
  if ([self class] == [DUNTimelineUserMessage class])
    return DUNTimelineInteractionMessage;
  else if ([self class] == [DUNTimelinePoll class])
    return DUNTimelineInteractionPoll;
  else if ([self class] == [DUNTimelineRating class])
    return DUNTimelineInteractionRating;

  //default is message
  return DUNTimelineInteractionMessage;
}

@end
