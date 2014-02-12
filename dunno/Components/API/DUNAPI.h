#import "DUNRequest.h"
#import "DUNTeacher.h"
#import "DUNOrganization.h"

@interface DUNAPI : NSObject

+ (void) organizationActiveToUser:(DUNTeacher*)user success:(void(^)(DUNOrganization *organization))successBlock error:(ErrorBlock)errorCallback;

+ (void) eventsAvailableToOrganization:(DUNOrganization*)organization success:(void(^)(NSArray *events))successBlock error:(ErrorBlock)errorCallback;


@end
