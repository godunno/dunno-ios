#import <JSONModel/JSONHTTPClient.h>
#import "DUNAPI.h"

#define kBaseURL @"http://localhost:3000/api/v1/"

#define kAppToken @"f81d4fae-7dec-11d0-a765-00a0c91e6bf6"

@implementation DUNAPI

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


+ (void) sendTimelineMessage:(DUNTimelineUserMessage*)message success:(void(^)(void))successBlock error:(void(^)(NSError *error))errorCallback
{
  NSString *timelineId = [DUNSession sharedInstance].currentEvent.timeline.entityId;
  
  NSParameterAssert(timelineId!=nil);
  NSParameterAssert(message.content!=nil);
  
  NSMutableDictionary * params = [self mandatoryParams];
  
  [params setObject:timelineId forKey:@"timeline_id"];
  [params setObject:message.content forKey:@"content"];
  
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",kBaseURL,@"timeline/messages"];
  
  [JSONHTTPClient postJSONFromURLWithString:endpointURL params:params completion:^(id json, JSONModelError *err) {
    if(successBlock && json != nil){
      successBlock();
    } else {
      errorCallback(err);
    }
  }];
  
}


////////////////////////////////////
#pragma mark Private Methods
////////////////////////////////////

+ (NSMutableDictionary*)mandatoryParams
{
  NSParameterAssert([DUNSession sharedInstance].currentStudent!=nil);
  NSParameterAssert([DUNSession sharedInstance].currentStudent.entityId!=nil);
  
  NSString *userId = [DUNSession sharedInstance].currentStudent.entityId;
  
  return [[NSMutableDictionary alloc] initWithDictionary:@{@"app_token" : kAppToken, @"student_id" : userId}];
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
