
@class DUNOrganization;
@class DUNTimeline;
@class DUNTimelineUserMessage;
@class DUNThermometer;


@interface DUNAPI : NSObject

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendTimelineMessage:(NSString*)content success:(void(^)(DUNTimelineUserMessage *messageCreated))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) attendEventWithUUID:(NSString*)eventUUID success:(void(^)(DUNEvent* event))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) upVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) downVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendAnswerPollOptionUUID:(NSString*)pollOptionUUID success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

+ (void) sendThermometer:(DUNThermometer *)thermometer withRatingValue:(NSString*)ratingValue success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback;

@end