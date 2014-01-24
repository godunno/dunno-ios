#import "DUNRequest.h"
#import "AFNetworking.h"

@implementation DUNRequest

+ (void) post:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL))success failure:(void (^)(NSError *))failure
{
  NSParameterAssert(url);
  
  NSURL *baseURL = [NSURL URLWithString:url];
  AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
  [client setDefaultHeader:@"Accept" value:@"application/json"];  
  [client setParameterEncoding:AFJSONParameterEncoding];
  [client postPath:nil parameters:parameter
           success:^(AFHTTPRequestOperation *operation, id JSON) {
             success(TRUE);
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             failure(error);
           }];
}

+ (void) get:(NSString*)url
     success:(void (^)(NSDictionary *json))success
     failure:(ErrorBlock)failure
{
  NSParameterAssert(url);
  
  NSURL *baseURL = [NSURL URLWithString:url];
  
  AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
  [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
  [client setDefaultHeader:@"Accept" value:@"application/json"];
  
  [client getPath:nil
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id JSON) {
            success(JSON);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
          }
   ];
}


@end
