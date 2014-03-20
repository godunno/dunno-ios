#import "DUNSession.h"

#import "DUNEvent.h"
#import "DUNStudent.h"
#import "DUNPoll.h"

#import "DUNPusher.h"

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


+ (BOOL) hasActiveEvent
{
  return ([DUNSession sharedInstance].activeEvent!=nil);
}

@end
