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

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"entityId", @"student" : @"owner", @"created_at":@"sentAt"}];
}

@end
