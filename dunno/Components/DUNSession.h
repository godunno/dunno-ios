#import "DUNOrganization.h"
#import "DUNEvent.h"
#import "DUNTeacher.h"

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNOrganization *currentOrganization;
@property (nonatomic, strong) DUNEvent *currentEvent;
@property (nonatomic, copy) NSString *userChannel;
@property (nonatomic, strong) DUNTeacher *currentUser;

+ (instancetype) sharedInstance;

+ (BOOL) hasActiveEvent;

@end
