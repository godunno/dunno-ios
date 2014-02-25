#import <JSONModel/JSONModel.h>
#import "DUNTimelineUserMessage.h"

@interface DUNTimeline : JSONModel

@property (nonatomic, copy) NSString *entityId;

@property (nonatomic, strong) NSDate<Optional> *startAt;

@property (nonatomic, strong) NSMutableArray<DUNTimelineUserMessage, Optional> *interactions;

@end
