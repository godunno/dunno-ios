#import "DUNOrganization.h"

@class DUNEvent;
@class DUNStudent;
@class DUNPoll;

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNEvent *activeEvent;
@property (nonatomic, strong) DUNStudent *currentStudent;
// TODO wtf?????? remove this..
@property (nonatomic, strong) DUNPoll *currentPoll;

@property (nonatomic, copy) NSString *pusherUserChannel;

+ (DUNSession*) sharedInstance;

+ (BOOL) hasActiveEvent;




@end
