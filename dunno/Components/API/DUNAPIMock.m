#import "DUNAPIMock.h"
#import "NSDate-Utilities.h"
#import "DUNTimelineUserMessage.h"

@implementation DUNAPIMock

+ (DUNUser*)user
{
  DUNUser *user = [DUNUser new];
  user.entityId = @"666";
  user.name = @"Gildo";
  user.email = @"fagnermoura@gmail.com";
  user.pictureURLString = @"https://www.gravatar.com/avatar/c1b77e3ec0a171379300ea493157bbe3?s=42&d=identicon&r=PG";
  
  return user;
}

+ (DUNEvent*) event
{
  DUNEvent *event = [DUNEvent new];
  event.entityId = @"999";
  event.name = @"Jung e a imagem";
  event.shortDescription = @"Aula inicial sobre Jung e sua prática";
  event.startAt = [NSDate dateWithDaysFromNow:20];
  event.pictureURLString = @"";
  event.status = DUNEventAvailable;
  event.organization = [DUNAPIMock organization];
  event.owner = [DUNAPIMock user];
  event.timeline = [DUNAPIMock timeline];
  
  return event;
}


+ (DUNOrganization*)organization
{
  DUNOrganization *o = [DUNOrganization new];
  o.uuid = @"a83355ae-e406-40c9-a28a-45a63215b165";
  o.name = @"PUC";
  return o;
}

+ (DUNTimeline*)timeline
{
  DUNTimeline* timeline = [DUNTimeline new];
  timeline.startedAt = [NSDate dateWithHoursFromNow:1];
  timeline.interactions = [NSMutableArray array];

  DUNTimelineUserMessage *i = [DUNTimelineUserMessage new];
  i.entityId = @"777";
  i.owner = [DUNAPIMock user];
  i.profilePicture = @"https://2.gravatar.com/avatar/d2a1bc47bf4b15aefd7dba4bf77dded6?d=https%3A%2F%2Fidenticons.github.com%2Fb70d53e6457d7318ea8e5d093d3e404d.png&r=x&s=440";
  i.message = @"Eu acho que dentro do átomo possui uma bolinha da FIFA.";
  
  for (int x=1; x<=10; x++) {
    [timeline addInteraction:i];
  }
  
  return timeline;
}

@end
