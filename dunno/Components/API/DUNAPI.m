#import "DUNEvent.h"
#import "DUNOrganization.h"
#import "DUNTimeline.h"
#import "DUNTimelineUserMessage.h"
#import "DUNThermometer.h"
#import "DUNStudent.h"

#import "DUNAPI.h"
#import <AFNetworking/AFNetworking.h>

//static const NSString *BASE_URL = @"http://localhost:3000/api/v1/";
//static const NSString *BASE_URL = @"http://192.168.2.4:3000/api/v1/";
static const NSString *BASE_URL = @"http://dunno.ngrok.com/api/v1/";
//static const NSString *BASE_URL = @"http://dunnovc-staging.herokuapp.com/api/v1/";

@implementation DUNAPI

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorBlock
{
  NSParameterAssert(username!=nil);
  NSParameterAssert(password!=nil);
  
  NSMutableDictionary * params = [self mandatoryParams:false];
  
  [params setObject:username forKey:@"student[email]"];
  [params setObject:password forKey:@"student[password]"];
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",BASE_URL,@"students/sign_in"];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager POST:endpointURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNStudent *student = [MTLJSONAdapter modelOfClass:DUNStudent.class fromJSONDictionary:responseObject error:&error];
    
    if(!error)
      successBlock(student);
    else
      errorBlock(error);
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];
}

+ (void) sendTimelineMessage:(NSString*)content success:(void(^)(DUNTimelineUserMessage *messageCreated))successBlock error:(void(^)(NSError *error))errorBlock
{
  NSString *timelineId = [[DUNSession sharedInstance].activeEvent.timeline.entityId stringValue];
  NSString *studentId = [[DUNSession sharedInstance].currentStudent.entityId stringValue];
  
  NSParameterAssert(timelineId!=nil);
  NSParameterAssert(studentId!=nil);
  NSParameterAssert(content!=nil);
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:studentId forKey:@"timeline_user_message[student_id]"];
  [params setObject:timelineId forKey:@"timeline_user_message[timeline_id]"];
  [params setObject:content forKey:@"timeline_user_message[content]"];
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",BASE_URL,@"timeline/messages"];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager POST:endpointURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *messageCreated = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:responseObject error:&error];
    messageCreated.owner = [DUNSession sharedInstance].currentStudent;
    
    if(!error)
    {
      successBlock(messageCreated);
    } else {
      errorBlock(error);
    }
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];

}

+ (void) attendEventWithUUID:(NSString*)eventUUID success:(void(^)(DUNEvent* event))successBlock error:(void(^)(NSError *error))errorBlock
{
  NSParameterAssert(eventUUID!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/events/%@/attend.json",BASE_URL,eventUUID];
  
  endpointURL = [DUNAPI appendToURLString:endpointURL dictionaryParams:[self mandatoryParams]];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager GET:endpointURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNEvent *event = [MTLJSONAdapter modelOfClass:DUNEvent.class fromJSONDictionary:responseObject error:&error];

    if(!error)
      successBlock(event);
    else
      errorBlock(error);
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];
  
}

+ (void) upVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(message!=nil);
  NSParameterAssert(message.entityId!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/timeline/messages/%@/up",BASE_URL,message.entityId];
  
  NSMutableDictionary * params = [self mandatoryParams];
  [params setObject:_session.currentStudent.entityId forKey:@"student_id"];
  

  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager POST:endpointURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *messageCreated = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:responseObject error:&error];
    messageCreated.owner = [DUNSession sharedInstance].currentStudent;
    
    successBlock();
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];
  
}

+ (void) downVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(message!=nil);
  NSParameterAssert(message.entityId!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/timeline/messages/%@/down",BASE_URL,message.entityId];
  
  NSMutableDictionary * params = [self mandatoryParams];
  [params setObject:_session.currentStudent.entityId forKey:@"student_id"];


  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager POST:endpointURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *messageCreated = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:responseObject error:&error];
    messageCreated.owner = [DUNSession sharedInstance].currentStudent;
    
    successBlock();
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];
  
}

+ (void) sendThermometer:(DUNThermometer *)thermometer withRatingValue:(NSString*)ratingValue success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(thermometer!=nil);
  NSParameterAssert(ratingValue!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/ratings",BASE_URL];
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:ratingValue   forKey:@"rating[value]"];
  [params setObject:thermometer.uuid forKey:@"thermometer_id"];
  
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager POST:endpointURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *messageCreated = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:responseObject error:&error];
    messageCreated.owner = [DUNSession sharedInstance].currentStudent;
    
    successBlock();
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];
  
}

+ (void) sendAnswerPollOptionUUID:(NSString*)pollOptionUUID success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorBlock
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(pollOptionUUID!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/answers",BASE_URL];
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:pollOptionUUID forKey:@"option_id"];
  [params setObject:_session.currentStudent.entityId forKey:@"student_id"];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager POST:endpointURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *messageCreated = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:responseObject error:&error];
    messageCreated.owner = [DUNSession sharedInstance].currentStudent;
    
    successBlock();
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    errorBlock(error);
  }];
  
}

#pragma mark -
#pragma mark - Private Methods

+ (NSMutableDictionary*)mandatoryParams
{
  return [DUNAPI mandatoryParams:true];
}

+ (NSMutableDictionary*)mandatoryParams:(BOOL)validatesStudent
{
  NSMutableDictionary *mandatoryParams = [[NSMutableDictionary alloc] init];
  DUNSession *_session = [DUNSession sharedInstance];
  
  if(validatesStudent)
  {
    NSParameterAssert(_session.currentStudent!=nil);
    NSParameterAssert(_session.currentStudent.email!=nil);
    NSParameterAssert(_session.currentStudent.authToken!=nil);
    
    [mandatoryParams setObject:_session.currentStudent.email forKey:@"student_email"];
    [mandatoryParams setObject:_session.currentStudent.authToken forKey:@"student_token"];
  }
  
  return mandatoryParams;
}

+ (NSString*)appendToURLString:(NSString*)urlString dictionaryParams:(NSDictionary*)params
{
  if(params>0)
    urlString = [urlString stringByAppendingString:@"?"];
  
  for (NSString* key in params) {
    id value = [params objectForKey:key];
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,value]];
  }
  
  urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
  return urlString;
}

@end
