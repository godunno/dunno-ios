#import <JSONModel/JSONModel.h>

#import "DUNTimelineInteraction.h"

@interface DUNTimeline : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) NSDate<Optional> *startAt;
@property (nonatomic, strong) NSMutableArray<Optional> *interactions;

- (void) addInteraction:(DUNTimelineInteraction*)interaction;

@end
