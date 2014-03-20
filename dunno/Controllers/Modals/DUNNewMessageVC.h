#import "DUNTimelineUserMessage.h"

#define kDUNNewMessageVCNibName @"DUNNewMessageVC"

@protocol DUNNewMessageDelegate
@required
- (void) messageSent:(DUNTimelineUserMessage*)message;
@end

@interface DUNNewMessageVC : UIViewController

@property (nonatomic, weak) id<DUNNewMessageDelegate> delegate;

@end
