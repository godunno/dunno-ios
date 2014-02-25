#import "DUNTimelineMessageCell.h"
#import "NSDate-Utilities.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DUNTimelineMessageCell()

@property (weak, nonatomic) IBOutlet UIImageView *timelineCellBackground;

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *sentAt;

@property (weak, nonatomic) IBOutlet UITextView *messageText;

@property (weak, nonatomic) IBOutlet UIButton *upVoteButton;
@property (weak, nonatomic) IBOutlet UILabel *upVoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *downVoteButton;
@property (weak, nonatomic) IBOutlet UILabel *downVoteLabel;

@end

@implementation DUNTimelineMessageCell

- (void) setUserMessage:(DUNTimelineUserMessage *)userMessage
{
  _userMessage = userMessage;
  
  _sentAt.text = [NSString stringWithFormat:@"%d:%d",[_userMessage.sentAt hour],[_userMessage.sentAt minute]];
  
//  [_profilePicture setImageWithURL:userMessage.student.profilePicture]];
  
  _messageText.text = self.userMessage.content;
  
  _upVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.upVotes] intValue]];
  _downVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.downVotes] intValue]];
  
}

- (IBAction)upVote:(id)sender {
  [self.userMessage addOneUpVote];
  _upVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.upVotes] intValue]];
}

- (IBAction)downVote:(id)sender {
  [self.userMessage addOneDownVote];
  _downVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.downVotes] intValue]];
}

@end
