//
//  DUNTimelineMessage.m
//  dunno
//
//  Created by fagner feitosa on 1/22/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNTimelineMessageCell.h"

@interface DUNTimelineMessageCell()
@property (weak, nonatomic) IBOutlet UIView *messageBox;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UITextView *messageText;
@property (weak, nonatomic) IBOutlet UIButton *upVoteButton;
@property (weak, nonatomic) IBOutlet UIButton *downVoteButton;
@end

@implementation DUNTimelineMessageCell

- (void) setUserMessage:(DUNTimelineUserMessage *)userMessage
{
  _userMessage = userMessage;
  
  [self showMessage];
}


#pragma mark - Private methods

- (void) showMessage
{
  self.messageText.text = self.userMessage.message;
}


@end
