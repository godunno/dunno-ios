#import "DUNTimelineInteraction.h"

@interface DUNTimeline : NSObject

@property (nonatomic, strong) NSDate *startedAt;

@property (nonatomic, strong) NSMutableArray *interactions;

- (void) addInteraction:(DUNTimelineInteraction*)interaction;

@end
