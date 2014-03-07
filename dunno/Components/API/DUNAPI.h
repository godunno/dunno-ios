#import "DUNStudent.h"
#import "DUNOrganization.h"
#import "DUNTimeline.h"
#import "DUNTimelineUserMessage.h"
#import "DUNThermometer.h"

@interface DUNAPI : NSObject

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) organizationActiveSuccess:(void(^)(DUNOrganization *organization))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendTimelineMessage:(NSString*)content success:(void(^)(DUNTimelineUserMessage *messageCreated))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) attendEventWithUUID:(NSString*)eventUUID onOrganizationWithUUID:(NSString*)organizationUUID success:(void(^)(DUNEvent* event))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) upVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) downVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendThermometer:(DUNThermometer *)thermometer withRatingValue:(NSDecimalNumber*)ratingValue success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

@end