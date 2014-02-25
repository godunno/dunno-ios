#import "DUNTimelineUserMessage.h"


#define kTimelineMessageCellId @"TimelineMessageCellId"

@interface DUNTimelineMessageCell : UITableViewCell

@property (nonatomic, weak) DUNTimelineUserMessage *userMessage;

@end
