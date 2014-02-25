#import "DUNUser.h"

//import cycle..
@class DUNOrganization;

@interface DUNStudent : DUNUser

@property (nonatomic, strong) NSString *authToken;

@property (nonatomic, strong) DUNOrganization *organization;



@end
