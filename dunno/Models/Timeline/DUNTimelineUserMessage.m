#import "DUNTimelineUserMessage.h"

@implementation DUNTimelineUserMessage


- (void) addOneUpVote
{
  self.upVoteCount += 1;
}

- (void) addOneDownVote
{
  self.downVoteCount += 1;
}


@end
