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
                                                     @"receive_poll_event": @"receivePollEvent",
                                                     @"receive_rating_event": @"receiveRatingEvent",
                                                     @"student_message_event": @"studentMessageEvent",
                                                     @"up_down_vote_message_event": @"upDownVoteMessageEvent",
                                                     }];
}

@end
