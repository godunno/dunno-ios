#import <JSONModel/JSONHTTPClient.h>
#import "DUNAPI.h"

#define kBaseURL @"http://192.168.0.101:3000/api/v1/"
//#define kBaseURL @"http://localhost:3000/api/v1/"

//#define kBaseURL @"http://dunnovc-staging.herokuapp.com/api/v1/"

@implementation DUNAPI

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorCallback
{
  NSParameterAssert(username!=nil);
  NSParameterAssert(password!=nil);
  
  NSMutableDictionary * params = [self mandatoryParams:false];
  
  [params setObject:username forKey:@"student[email]"];
  [params setObject:password forKey:@"student[password]"];
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",kBaseURL,@"students/sign_in"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *err) {
    
    NSString *error = [json valueForKey:@"error"];
    
    if(successBlock && json!=nil && error == nil){
      DUNStudent *student = [[DUNStudent alloc] init];
      
      if(student==nil)
      {
        errorCallback(err);
      }else{
        successBlock(student);
      }
      
    }
    else {
      errorCallback(err);
    }
  }];
  
}

+ (void) organizationActiveSuccess:(void(^)(DUNOrganization *organization))successBlock error:(void(^)(NSError *error))errorCallback
{
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",kBaseURL,@"organizations"];
  endpointURL = [DUNAPI appendToURLString:endpointURL dictionaryParams:[self mandatoryParams]];
  
  [JSONHTTPClient getJSONFromURLWithString:endpointURL completion:^(id json, JSONModelError *err) {
    
    if(successBlock && json != nil){
      DUNOrganization *organization = [[DUNOrganization alloc] initWithDictionary:json error:&err];
      
      successBlock(organization);
    }
    else {
      errorCallback(err);
    }
  }];
  
}

+ (void) sendTimelineMessage:(NSString*)content success:(void(^)(DUNTimelineUserMessage *messageCreated))successBlock error:(void(^)(NSError *error))errorCallback
{
  NSString *timelineId = [DUNSession sharedInstance].currentEvent.timeline.entityId;
  NSString *studentId = [DUNSession sharedInstance].currentStudent.entityId;
  
  NSParameterAssert(timelineId!=nil);
  NSParameterAssert(studentId!=nil);
  NSParameterAssert(content!=nil);
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:studentId forKey:@"timeline_user_message[student_id]"];
  [params setObject:timelineId forKey:@"timeline_user_message[timeline_id]"];
  [params setObject:content forKey:@"timeline_user_message[content]"];
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",kBaseURL,@"timeline/messages"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *err) {
    if(successBlock){
      
      DUNTimelineUserMessage *messageCreated = [[DUNTimelineUserMessage alloc] initWithDictionary:json error:&err];
      messageCreated.owner = [DUNSession sharedInstance].currentStudent;
      messageCreated.downVotes = 0;
      messageCreated.upVotes = 0;
      successBlock(messageCreated);
      
    } else if(err) {
      errorCallback(err);
    }
  }];
  
}

+ (void) attendEventWithUUID:(NSString*)eventUUID onOrganizationWithUUID:(NSString*)organizationUUID success:(void(^)(DUNEvent* event))successBlock error:(void(^)(NSError *error))errorCallback
{
  NSParameterAssert(eventUUID!=nil);
  NSParameterAssert(organizationUUID!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/organizations/%@/events/%@/attend.json",kBaseURL,organizationUUID,eventUUID];
  
  endpointURL = [DUNAPI appendToURLString:endpointURL dictionaryParams:[self mandatoryParams]];
  
  [JSONHTTPClient getJSONFromURLWithString:endpointURL completion:^(id json, JSONModelError *err) {
    
    if(successBlock && json != nil){
      DUNEvent *event = [[DUNEvent alloc] initWithDictionary:json error:&err];
      
      successBlock(event);
    }
    else {
      errorCallback(err);
    }
    
  }];
  
}

+ (void) upVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(message!=nil);
  NSParameterAssert(message.entityId!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/timeline/messages/%@/up",kBaseURL,message.entityId];
  
  NSMutableDictionary * params = [self mandatoryParams];
  [params setObject:_session.currentStudent.entityId forKey:@"student_id"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *error){
    
    if(successBlock && error==nil){
      successBlock();
    } else if(error) {
      errorCallback(error);
    }
    
  }];
}

+ (void) downVoteTimelineMessage:(DUNTimelineUserMessage *)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(message!=nil);
  NSParameterAssert(message.entityId!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/timeline/messages/%@/down",kBaseURL,message.entityId];
  
  NSMutableDictionary * params = [self mandatoryParams];
  [params setObject:_session.currentStudent.entityId forKey:@"student_id"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *error) {
    
    if(successBlock && error==nil){
      successBlock();
    } else if(error) {
      errorCallback(error);
    }
  }];
}

+ (void) sendThermometer:(DUNThermometer *)thermometer withRatingValue:(NSString*)ratingValue success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(thermometer!=nil);
  NSParameterAssert(ratingValue!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/ratings",kBaseURL];
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:ratingValue   forKey:@"rating[value]"];
  [params setObject:thermometer.uuid forKey:@"thermometer_id"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *error) {
    
    if(successBlock && error==nil){
      successBlock();
    } else if(error) {
      errorCallback(error);
    }
  }];
  
}

+ (void) sendAnswerPollOptionUUID:(NSString*)pollOptionUUID success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback
{
  DUNSession *_session = [DUNSession sharedInstance];
  
  NSParameterAssert(_session.currentStudent!=nil);
  NSParameterAssert(_session.currentStudent.entityId!=nil);
  NSParameterAssert(pollOptionUUID!=nil);
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/answers",kBaseURL];
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:pollOptionUUID forKey:@"option_id"];
  [params setObject:_session.currentStudent.entityId forKey:@"student_id"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *error) {
    
    if(successBlock && error==nil){
      successBlock();
    } else if(error) {
      errorCallback(error);
    }
  }];
  
}

////////////////////////////////////
#pragma mark Private Methods
////////////////////////////////////
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
