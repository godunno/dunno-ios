//
//  DUNTimelineMessage.m
//  dunno
//
//  Created by fagner feitosa on 1/22/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNTimelineMessageCell.h"

@interface DUNTimelineMessageCell()

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UITextView *messageText;
@property (weak, nonatomic) IBOutlet UIButton *upVoteButton;
@property (weak, nonatomic) IBOutlet UIButton *downVoteButton;
@property (weak, nonatomic) IBOutlet UILabel *upVoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *downVoteLabel;
@end

@implementation DUNTimelineMessageCell

- (void) setUserMessage:(DUNTimelineUserMessage *)userMessage
{
  _userMessage = userMessage;

  
  //show profile pic
  self.upVoteLabel.text = [NSString stringWithFormat:@"%d",userMessage.upVoteCount];
  self.downVoteLabel.text = [NSString stringWithFormat:@"%d",userMessage.downVoteCount];
  
  [self showMessage];
}


- (IBAction)upVote:(id)sender {
  [self.userMessage addOneUpVote];
  self.upVoteLabel.text = [NSString stringWithFormat:@"%d",self.userMessage.upVoteCount];
}

- (IBAction)downVote:(id)sender {
  [self.userMessage addOneDownVote];
  self.downVoteLabel.text = [NSString stringWithFormat:@"%d",self.userMessage.downVoteCount];
}


#pragma mark - Private methods

- (void) showMessage
{
  self.messageText.text = self.userMessage.message;
}


@end
