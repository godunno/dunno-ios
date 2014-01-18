//
//  DUNPusher.h
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Pusher/Pusher.h>

typedef void (^DUNPusherEventBlockHandler)(NSData *);

@interface DUNPusher : NSObject<PTPusherDelegate>

+ (DUNPusher*) sharedInstance;

- (void) connect;
- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(DUNPusherEventBlockHandler)handler;

@end
