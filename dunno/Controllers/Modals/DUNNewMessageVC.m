#import "DUNNewMessageVC.h"

#import "DUNTimelineUserMessage.h"
#import "DUNAPI.h"

#import "FUIButton.h"

@interface DUNNewMessageVC ()

@property (nonatomic, strong) DUNSession *session;

@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet FUIButton *sendMessageButton;

@end

@implementation DUNNewMessageVC


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  
  [self customize];
}

- (IBAction)sendMessage:(id)sender {
  
  [DUNAPI sendTimelineMessage:_messageTextView.text success:^(DUNTimelineUserMessage *messageCreated) {
    
    [_delegate messageSent:messageCreated];
    
  } error:^(NSError *error) {
    [DUNErrorVC showWithTitle:@"Timeline Message" andMessage:@"Erro enviando mensagem para timeline."];
  }];
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
  
  _sendMessageButton = [DUNStyles customizeOKButton:_sendMessageButton];
}

@end
