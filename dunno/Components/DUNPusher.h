#import <Pusher/Pusher.h>

typedef void (^DUNPusherEventBlockHandler)(NSData *);

@interface DUNPusher : NSObject<PTPusherDelegate>

+ (DUNPusher*) sharedInstance;

- (void) connect;
- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(DUNPusherEventBlockHandler)handler;

@end
