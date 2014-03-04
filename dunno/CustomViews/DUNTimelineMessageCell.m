#import "DUNTimelineMessageCell.h"
#import "NSDate-Utilities.h"

#import "DUNAPI.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation DUNTimelineMessageCell

- (void) setUserMessage:(DUNTimelineUserMessage *)userMessage
{
  
  _userMessage = userMessage;
  
  _sentAt.text = [NSString stringWithFormat:@"%d:%d",[userMessage.sentAt hour],[userMessage.sentAt minute]];
  
  [_profilePicture setImageWithURL:[NSURL URLWithString:userMessage.owner.avatarURLString]];
  
  _messageText.text = userMessage.content;
  
  _upVoteLabel.text = [NSString stringWithFormat:@"%d", [userMessage.upVotes integerValue]];
  _downVoteLabel.text = [NSString stringWithFormat:@"%d", [userMessage.downVotes integerValue]];
  
}

- (IBAction)upVote:(id)sender {
  
  [DUNAPI upVoteTimelineMessage:_userMessage success:^{
    NSLog(@"up vote message OK..");
  } error:^(NSError *error) {
    NSLog(@"deu merda upVote message..");
  }];
  
}

- (IBAction)downVote:(id)sender {
  
  [DUNAPI downVoteTimelineMessage:_userMessage success:^{
    
    NSLog(@"down vote message OK..");
    
  } error:^(NSError *error) {
    NSLog(@"deu merda downVote message..");
  }];
}

@end
