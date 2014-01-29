#import "DUNTimelineMessageCell.h"

@interface DUNTimelineMessageCell()

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UITextView *messageText;
@property (weak, nonatomic) IBOutlet UIButton *upVoteButton;
@property (weak, nonatomic) IBOutlet UIButton *downVoteButton;
@property (weak, nonatomic) IBOutlet UILabel *upVoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *downVoteLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageTextHeightConstraint;

@end

@implementation DUNTimelineMessageCell

- (void) setUserMessage:(DUNTimelineUserMessage *)userMessage
{
  _userMessage = userMessage;
  
  _upVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.upVoteCount] intValue]];
  _downVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.downVoteCount] intValue]];
  
  [self showMessage];
}

- (IBAction)upVote:(id)sender {
  [self.userMessage addOneUpVote];
  _upVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.upVoteCount] intValue]];
}

- (IBAction)downVote:(id)sender {
  [self.userMessage addOneDownVote];
  _downVoteLabel.text = [NSString stringWithFormat:@"%i",[[NSNumber numberWithInteger:(NSInteger)self.userMessage.downVoteCount] intValue]];
}

#pragma mark - Private methods

- (void) showMessage
{
  //
  CGSize sizeThatShouldFitTheContent = [_messageText sizeThatFits:_messageText.frame.size];

  // min height
  if (sizeThatShouldFitTheContent.height<158) {
    sizeThatShouldFitTheContent.height = 158;
  }
  
  _messageTextHeightConstraint.constant = sizeThatShouldFitTheContent.height;
  
  _messageText.text = self.userMessage.message;
}

@end
