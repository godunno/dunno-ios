#import "DUNUser.h"
#import "DUNTeacher.h"
#import "DUNOrganization.h"

@interface DUNAPIMock : NSObject

+ (DUNUser*)user;
+ (DUNTeacher*)teacher;
+ (DUNEvent*) event;
+ (DUNOrganization*)organization;

@end
