#import "DUNOrganization.h"
#import "DUNEvent.h"
#import "DUNStudent.h"
#import "DUNPoll.h"

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNOrganization *currentOrganization;
@property (nonatomic, strong) DUNEvent *currentEvent;
@property (nonatomic, copy) NSString *userChannel;
@property (nonatomic, strong) DUNStudent *currentStudent;
@property (nonatomic, strong) DUNPoll *currentPoll;

+ (instancetype) sharedInstance;

+ (BOOL) hasActiveEvent;

@end
