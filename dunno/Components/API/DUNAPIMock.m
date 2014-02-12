#import "DUNAPIMock.h"
#import "NSDate-Utilities.h"
#import "DUNTimelineUserMessage.h"

@implementation DUNAPIMock

+ (DUNUser*)user
{
  DUNUser *user = [DUNUser new];
  user.uuid = @"666";
  user.name = @"Gildo";
  user.email = @"fagnermoura@gmail.com";
  user.pictureURLString = @"https://www.gravatar.com/avatar/c1b77e3ec0a171379300ea493157bbe3?s=42&d=identicon&r=PG";
  
  return user;
}


+ (DUNUser*)teacher
{
  DUNTeacher *user = [DUNTeacher new];
  user.uuid = @"999";
  user.name = @"Lucas Boscacci";
  user.email = @"lucas@me.com";
  user.pictureURLString = @"https://www.gravatar.com/avatar/c1b77e3ec0a171379300ea493157bbe3?s=42&d=identicon&r=PG";
  
  return user;
}


+ (DUNEvent*) event
{
  DUNEvent *event = [DUNEvent new];
  event.uuid = @"999";
  event.title = @"Jung e a imagem";
  event.startAt = [NSDate dateWithDaysFromNow:20];
  event.status = DUNEventAvailable;
  event.organization = [DUNAPIMock organization];
  event.teacher = [DUNAPIMock teacher];
  
  return event;
}


+ (DUNOrganization*)organization
{
  DUNOrganization *o = [DUNOrganization new];
  o.uuid = @"8a56609e-87e2-41f1-a1dd-927981e68ebc";
  o.name = @"PUC";
  return o;
}


@end
