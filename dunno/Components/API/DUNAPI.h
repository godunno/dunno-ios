#import "DUNTeacher.h"
#import "DUNOrganization.h"

@interface DUNAPI : NSObject

+ (void) organizationActiveSuccess:(void(^)(DUNOrganization *organization))successBlock error:(void(^)(NSError *error))errorCallback;

@end
