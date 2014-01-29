#import "DUNEvent.h"

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNEvent *currentEvent;
@property (nonatomic, copy) NSString *userChannel;

+ (DUNSession*) sharedInstance;

@end
