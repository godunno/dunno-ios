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
