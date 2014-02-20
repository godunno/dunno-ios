#import "DUNStudent.h"
#import "DUNOrganization.h"
#import "DUNTimelineUserMessage.h"

@interface DUNAPI : NSObject

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) organizationActiveSuccess:(void(^)(DUNOrganization *organization))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendTimelineMessage:(DUNTimelineUserMessage*)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;
@end
