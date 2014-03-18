#import "DUNUser.h"

//import cycle..
@class DUNOrganization;

@interface DUNStudent : DUNUser

@property (nonatomic, copy) NSString<Optional> * avatarURLString;
@property (nonatomic, copy) NSString<Optional> *authToken;

@property (nonatomic, strong) DUNOrganization<Optional> *organization;



@end
