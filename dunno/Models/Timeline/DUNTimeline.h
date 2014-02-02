#import "DUNTimelineInteraction.h"
#import "DUNEvent.h"

@interface DUNTimeline : NSObject

@property (nonatomic, strong) DUNEvent *event;
@property (nonatomic, strong) NSMutableArray *interactions;

- (void) addInteraction:(DUNTimelineInteraction*)interaction;

@end
