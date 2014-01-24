#import "DUNPollModalVC.h"
#import "DUNTimelinePoll.h"
#import "UIViewController+CWPopup.h"

@interface DUNPollModalVC ()
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@end

@implementation DUNPollModalVC

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  _question.text = _poll.question;
  _firstButton.titleLabel.text = _poll.options[0];
  _secondButton.titleLabel.text = _poll.options[1];

}


//////////////////////////////////////////////
#pragma mark  - IBActions
//////////////////////////////////////////////
- (IBAction)firstButtonTapped:(id)sender {
  NSLog(@"tap first button at Poll");
  [self.presentingVC dismissPopupViewControllerAnimated:YES completion:nil];
}

- (IBAction)secondButtonTapped:(id)sender {
  NSLog(@"tap second button at Poll");
  [self.presentingVC dismissPopupViewControllerAnimated:YES completion:nil];  
}

@end
