#import "DUNOrganization.h"
#import "DUNEvent.h"
#import "DUNUser.h"

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNOrganization *currentOrganization;
@property (nonatomic, strong) DUNEvent *currentEvent;
@property (nonatomic, copy) NSString *userChannel;
@property (nonatomic, strong) DUNUser *currentUser;

+ (DUNSession*) sharedInstance;

+ (BOOL) hasActiveEvent;

@end
