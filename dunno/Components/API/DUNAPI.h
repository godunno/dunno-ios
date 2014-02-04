#import <Foundation/Foundation.h>
#import "DUNRequest.h"
#import "DUNUser.h"
#import "DUNOrganization.h"

@interface DUNAPI : NSObject

+ (void) organizationActiveToUser:(DUNUser*)user success:(void(^)(DUNOrganization *organization))successBlock error:(ErrorBlock)errorCallback;

+ (void) eventsAvailableToOrganization:(DUNOrganization*)organization success:(void(^)(NSArray *events))successBlock error:(ErrorBlock)errorCallback;


@end
