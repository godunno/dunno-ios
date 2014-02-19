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
  self.upVoteCount += 1;
}

- (void) addOneDownVote
{
  self.downVoteCount += 1;
}

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"entityId", @"created_at":@"sentAt"}];
}

@end
