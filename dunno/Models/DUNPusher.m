//
//  DUNPusher.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNPusher.h"
#import <Reachability/Reachability.h>

@interface DUNPusher()
@property (strong, nonatomic) PTPusher *client;
@end

@implementation DUNPusher

@synthesize client = _client;

+ (DUNPusher*) sharedInstance
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

#pragma mark - Pusher

- (void)_setup
{
  _client = [PTPusher pusherWithKey:PUSHER_ACCESS_KEY delegate:self encrypted:NO];
  _client.reconnectDelay = 3.0;
}

- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(DUNPusherEventBlockHandler)handler
{
  
  PTPusherChannel *channel = [_client subscribeToChannelNamed:channelName];
  [channel bindToEventNamed:eventName handleWithBlock:^(PTPusherEvent *channelEvent) {
    
    // channelEvent.data is a NSDictionary of the JSON object received.
    // convert back to json
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:channelEvent.data options:0 error:&error];
    
    if (!jsonData) {
      
      NSLog(@"Pusher error on receive message: %@", error);
      handler(nil);
      
    } else {
      NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
      NSLog(@"Pusher received message: %@",jsonString);
      
      handler(jsonData);
    }
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
