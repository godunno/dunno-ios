#import <Pusher/Pusher.h>

typedef void (^DUNPusherEventBlockHandler)(NSDictionary *jsonDictionary);

@interface DUNPusher : NSObject<PTPusherDelegate>

+ (DUNPusher*) sharedInstance;

- (DUNPusher*) connect;

- (void) unsubscribe:(NSString*)channelName;

- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(DUNPusherEventBlockHandler)handler;

@end
