#import "DUNTeacher.h"
#import "DUNOrganization.h"
#import "DUNTimelineUserMessage.h"

@interface DUNAPI : NSObject

+ (void) organizationActiveSuccess:(void(^)(DUNOrganization *organization))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendTimelineMessage:(DUNTimelineUserMessage*)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;
@end
