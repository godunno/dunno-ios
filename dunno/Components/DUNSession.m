#import "DUNSession.h"
#import "DUNAPIMock.h"

@interface DUNSession()
- (void) defineMocks;
@end

@implementation DUNSession

+ (instancetype) sharedInstance
{
  static dispatch_once_t p = 0;
  __strong static DUNSession *sharedObject = nil;
  dispatch_once(&p, ^{
    sharedObject = [[self alloc] init];
    [sharedObject defineMocks];
  });
  return sharedObject;
}


+ (BOOL) hasActiveEvent
{
  return ([DUNSession sharedInstance].currentEvent!=nil);
}

- (void) defineMocks
{
  _currentUser = [DUNAPIMock user];
  _currentOrganization = [DUNAPIMock organization];
  _currentEvent = [DUNAPIMock event];
}

@end
