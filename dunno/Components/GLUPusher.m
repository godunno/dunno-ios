//
//  GLUPusher.m
//  glunchyapp
//
//  Created by fagner feitosa on 1/9/14.
//  Copyright (c) 2014 mobo.fagner. All rights reserved.
//

#import "GLUPusher.h"
#import <Reachability/Reachability.h>


@interface GLUPusher()
@property (strong, nonatomic) PTPusher *client;
@end

@implementation GLUPusher

@synthesize client = _client;

 + (GLUPusher*) sharedInstance
{
  static dispatch_once_t p = 0;
  __strong static id sharedObject = nil;
  dispatch_once(&p, ^{
    sharedObject = [[self alloc] init];
  });
  return sharedObject;
}

- (id)init
{
  self = [super init];
  if (self) {
    [self _setup];
  }
  return self;
}

/////////////////////////////////
#pragma mark - Pusher
/////////////////////////////////

- (void)_setup
{
  _client = [PTPusher pusherWithKey:@"385ee49be118d9b8bf83" delegate:self encrypted:NO];
  _client.reconnectDelay = 3.0;
}

- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(GLUPusherEventBlockHandler)handler
{

  PTPusherChannel *channel = [_client subscribeToChannelNamed:channelName];
  [channel bindToEventNamed:eventName handleWithBlock:^(PTPusherEvent *channelEvent) {
    
    // channelEvent.data is a NSDictianary of the JSON object received
    // convert back to json
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:channelEvent.data options:0 error:&error];
    
    if (!jsonData) {
      NSLog(@"Pusher error on receive message: %@", error);
    } else {
      NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
      NSLog(@"Pusher received message: %@",jsonString);
    }
    
    handler(jsonData);
  }];
  
}

/////////////////////////////////
#pragma mark - Public API
/////////////////////////////////

- (void) connect
{
  [self.client connect];
}



@end
