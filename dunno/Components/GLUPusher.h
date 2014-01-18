//
//  GLUPusher.h
//  glunchyapp
//
//  Created by fagner feitosa on 1/9/14.
//  Copyright (c) 2014 mobo.fagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Pusher/Pusher.h>

typedef void (^GLUPusherEventBlockHandler)(NSData *);

@interface GLUPusher : NSObject<PTPusherDelegate>

+ (GLUPusher*) sharedInstance;

- (void) connect;
- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(GLUPusherEventBlockHandler)handler;

@end
