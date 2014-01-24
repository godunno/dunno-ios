#import "DUNAPI.h"

#define kBaseURL @"http://localhost:3000/api/v1/"

#define kAppToken @"f81d4fae-7dec-11d0-a765-00a0c91e6bf6"

@implementation DUNAPI

+ (void) organizationActiveToUser:(DUNUser*)user success:(void(^)(DUNOrganization *organization))successBlock error:(ErrorBlock)errorCallback
{
  NSString *endpointURL = [NSString stringWithFormat:@"%@/%@",kBaseURL,@"organization/to/user"];
  endpointURL = [DUNAPI appendToURLString:endpointURL dictionaryParams:[self mandatoryParams]];
  
  [DUNRequest get:endpointURL success:^(NSDictionary *json) {
    
    if(successBlock && json != nil){
      DUNOrganization *organization = [DUNOrganization newFromJsonDictionary:json];
      successBlock(organization);
    }
    else{
      errorCallback(nil);
    }
    
  }  failure:^(NSError *error) {
    errorCallback(error);
  }];
  
}

////////////////////////////////////
#pragma mark Private Methods
////////////////////////////////////

+ (NSDictionary*)mandatoryParams
{
  
  NSString *fakeUserId = @"666";
  
  return @{@"app_token" : kAppToken, @"user_id" : fakeUserId};
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