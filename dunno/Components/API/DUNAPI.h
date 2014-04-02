
@class DUNOrganization;
@class DUNTimeline;
@class DUNTimelineUserMessage;
@class DUNThermometer;


@interface DUNAPI : NSObject

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorBlock;

+ (void) sendTimelineMessage:(NSString*)content success:(void(^)(DUNTimelineUserMessage *messageCreated))successBlock error:(void(^)(NSError *error))errorBlock;

+ (void) attendEventWithUUID:(NSString*)eventUUID success:(void(^)(DUNEvent* event))successBlock error:(void(^)(NSError *error))errorBlock;

+ (void) upVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock;

+ (void) downVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock;

+ (void) sendAnswerPollOptionUUID:(NSString*)pollOptionUUID success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock;

+ (void) sendThermometer:(DUNThermometer *)thermometer withRatingValue:(NSString*)ratingValue success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock;

@end