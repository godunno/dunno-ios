#import <JSONModel/JSONModel.h>
#import "DUNTimelineUserMessage.h"

@interface DUNTimeline : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) NSDate<Optional> *startedAt;
@property (nonatomic, strong) NSMutableArray<DUNTimelineUserMessage, Optional> *messages;

- (void) updateMessage:(DUNTimelineUserMessage*)message;

@end
