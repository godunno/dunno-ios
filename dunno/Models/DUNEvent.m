#import "DUNEvent.h"

@implementation DUNEvent


- (BOOL) isOpen
{
  return true;
}

- (BOOL) isClosed
{
  return false;
}


- (DUNPoll*)findPollByUUID:(NSString*)pollUUID
{
  NSParameterAssert(pollUUID!=nil);
  
  __block DUNPoll* pollFound = nil;
  [_polls enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    pollFound =(DUNPoll*)obj;
    if ([((DUNPoll*)obj).uuid isEqualToString:pollUUID])
    {
    pollFound =(DUNPoll*)obj;
      *stop = TRUE;
    }
  }];
  
  if(pollFound==nil)
  {
    //TODO assert error?
    NSLog(@"poll with UUID: %@ not found at event %@", pollUUID, self.uuid);
  }
    
  
  return pollFound;
}


+(JSONKeyMapper*)keyMapper
{
  
  return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                     @"start_at": @"startAt",
                                                     @"channel": @"channelName",
                                                     @"release_poll_event": @"releasePollEvent",
                                                     @"close_event": @"closeEvent",
                                                     @"student_message_event": @"studentMessageEvent",
                                                     @"up_down_vote_message_event": @"upDownVoteMessageEvent",
                                                     @"up_down_vote_message_event": @"upDownVoteMessageEvent",                                                     
                                                     }];
}

@end
