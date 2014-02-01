#import "DUNTimelineInteraction.h"
#import "DUNEvent.h"

@interface DUNTimeline : NSObject

@property (nonatomic, strong) DUNEvent *event;
@property (nonatomic, strong) NSArray *interactions;

@end
