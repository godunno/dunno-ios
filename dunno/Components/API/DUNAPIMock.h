#import "DUNUser.h"
#import "DUNSpeaker.h"
#import "DUNLocation.h"
#import "DUNOrganization.h"

@interface DUNAPIMock : NSObject

+ (DUNUser*)user;
+ (DUNEvent*) event;
+ (DUNOrganization*)organization;
+ (DUNTimeline*)timeline;

@end
