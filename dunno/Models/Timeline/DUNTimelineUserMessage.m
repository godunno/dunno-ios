#import "DUNTimelineUserMessage.h"

@implementation DUNTimelineUserMessage


+ (instancetype) initWithContent:(NSString*)content
{
  DUNTimelineUserMessage *instance = [DUNTimelineUserMessage new];
  instance.content = content;
  
  return instance;
}

- (void) addOneUpVote
{
  self.upVotes = [NSNumber numberWithInt:[self.upVotes intValue] + 1];
}

- (void) addOneDownVote
{
  self.downVotes = [NSNumber numberWithInt:[self.downVotes intValue] + 1];
}

- (BOOL) isAlreadyVoted
{
  return (_alreadyVoted!=nil&&![_alreadyVoted isEqualToString:@"0"]);
}

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"entityId", @"student" : @"owner", @"created_at":@"sentAt", @"up_votes" : @"upVotes", @"down_votes" : @"downVotes", @"already_voted":@"alreadyVoted"}];
}

@end
