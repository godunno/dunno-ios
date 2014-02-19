#import "DUNNewMessageVC.h"
#import "FUIButton.h"
#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"

@interface DUNNewMessageVC ()

@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet FUIButton *sendMessageButton;

@end

@implementation DUNNewMessageVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self customize];
}

- (IBAction)sendMessage:(id)sender {
}

- (void) customize
{
  [self.view.layer setBorderColor:[DUNStyles backgroundColor].CGColor];
  [self.view.layer setBorderWidth:8.0f];
  [self.view.layer setCornerRadius:8.0f];
  self.view.layer.masksToBounds=YES;
  
  [_messageTextView.layer setBorderColor:[DUNStyles backgroundColor].CGColor];
  [_messageTextView.layer setBorderWidth:1.0f];
  [_messageTextView.layer setCornerRadius:8.0f];
  
  _sendMessageButton.buttonColor = [UIColor turquoiseColor];
  _sendMessageButton.shadowColor = [UIColor greenSeaColor];
  _sendMessageButton.shadowHeight = 3.0f;
  _sendMessageButton.cornerRadius = 6.0f;
  _sendMessageButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
  [_sendMessageButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
  [_sendMessageButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
  
}

@end
