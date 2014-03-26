#import "DUNPusher.h"
#import <Reachability/Reachability.h>

@interface DUNPusher()
@property (strong, nonatomic) PTPusher *client;
@end

@implementation DUNPusher

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
    
    if (!channelEvent.data) {
      NSLog(@"Pusher error on receive message: %@", error);
      handler(nil);
      
    } else {
       NSLog(@"Pusher received message (type: %@)",[channelEvent.data class]);

      if ([[channelEvent.data class] isKindOfClass:[NSDictionary class]]) {
        
      }
      
      handler(channelEvent.data);
    }
  }];
  
}

- (void) unsubscribe:(NSString*)channelName
{
  PTPusherChannel *channel = [_client subscribeToChannelNamed:channelName];
  [channel unsubscribe];
}

/////////////////////////////////
#pragma mark - Public API
/////////////////////////////////

- (DUNPusher*) connect
{
  [self.client connect];
  return self;
}



@end
