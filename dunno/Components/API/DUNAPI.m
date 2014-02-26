#import <JSONModel/JSONHTTPClient.h>
#import "DUNAPI.h"

// loopback not works on device :p
//#define kBaseURL @"http://localhost:3000/api/v1/"


#define kBaseURL @"http://192.168.0.188:3000/api/v1/"

//#define kBaseURL @"http://dunnovc-staging.herokuapp.com/api/v1/"

@implementation DUNAPI

+ (void) loginStudentUsername:(NSString*)username withPassword:(NSString*)password success:(void(^)(DUNStudent *student))successBlock error:(void(^)(NSError *error))errorCallback
{
  NSParameterAssert(username!=nil);
  NSParameterAssert(password!=nil);
  
  NSMutableDictionary * params = [self mandatoryParams:false];
  
  [params setObject:username forKey:@"student[email]"];
  [params setObject:password forKey:@"student[password]"];
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",kBaseURL,@"students/sign_in.json"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *err) {
    
    if(successBlock && json != nil){
      DUNStudent *student = [[DUNStudent alloc] initWithDictionary:json error:&err];
      
      successBlock(student);
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
