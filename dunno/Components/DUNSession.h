#import "DUNOrganization.h"

@class DUNEvent;
@class DUNStudent;
@class DUNPoll;

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNEvent *activeEvent;
@property (nonatomic, strong) DUNStudent *currentStudent;

// TODO wtf?????? remove this..
@property (nonatomic, strong) DUNPoll *currentPoll;

+ (DUNSession*) sharedInstance;

+ (BOOL) hasActiveEvent;

- (void) clearActiveEvent;

@end
