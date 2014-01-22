//
//  DUNUserMessage.m
//  dunno
//
//  Created by fagner feitosa on 1/22/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

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
