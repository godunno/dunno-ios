#import "DUNSession.h"

#import "DUNEvent.h"
#import "DUNStudent.h"
#import "DUNPoll.h"

@implementation DUNSession

+ (DUNSession*) sharedInstance
{
  static dispatch_once_t p = 0;
  __strong static DUNSession *sharedObject = nil;
  dispatch_once(&p, ^{
    sharedObject = [[self alloc] init];
  });
  return sharedObject;
}

- (void) clearActiveEvent
{
  if(self.activeEvent==nil)
    return;
  
  [self.pusher unsubscribe:self.activeEvent.channelName];
  self.activeEvent = nil;
}

#pragma mark -
#pragma mark - Private

- (DUNPusher *)pusher
{
  if(_pusher==nil)
    _pusher = [DUNPusher sharedInstance];
  
  return _pusher;
}


@end
