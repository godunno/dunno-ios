#import "DUNUser.h"

//import cycle..
@class DUNOrganization;

@interface DUNStudent : DUNUser

@property (nonatomic, strong) NSString<Optional> *authToken;

@property (nonatomic, strong) DUNOrganization<Optional> *organization;



@end
