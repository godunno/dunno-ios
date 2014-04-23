#import "DUNOrganization.h"

#import "DUNPusher.h"

@class DUNEvent;
@class DUNStudent;
@class DUNPoll;

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNPusher *pusher;

@property (nonatomic, strong) DUNEvent *activeEvent;
@property (nonatomic, strong) DUNStudent *currentStudent;

//TODO: Remove this and use other mechanism to store currentPoll
//@property (nonatomic, strong) DUNPoll *currentPoll;

+ (DUNSession*) sharedInstance;

- (void) clearActiveEvent;

@end
