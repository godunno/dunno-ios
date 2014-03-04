#import "DUNTimelineUserMessage.h"


#define kTimelineMessageCellId @"TimelineMessageCellId"

@interface DUNTimelineMessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *upVoteButton;
@property (weak, nonatomic) IBOutlet UILabel *upVoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *downVoteButton;
@property (weak, nonatomic) IBOutlet UILabel *downVoteLabel;
@property (weak, nonatomic) IBOutlet UIImageView *timelineCellBackground;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *sentAt;
@property (weak, nonatomic) IBOutlet UITextView *messageText;

@property (nonatomic, strong) DUNTimelineUserMessage *userMessage;

@end
