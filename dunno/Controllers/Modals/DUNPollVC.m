#import "DUNPollVC.h"
#import "FUIButton.h"
#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"

@interface DUNPollVC ()

@property (weak, nonatomic) IBOutlet UITextView *answerLabel;
@property (weak, nonatomic) IBOutlet FUIButton *noButton;

@property (weak, nonatomic) IBOutlet FUIButton *yesButton;
@end

@implementation DUNPollVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.view.layer setBorderColor:[DUNStyles backgroundColor].CGColor];
  [self.view.layer setBorderWidth:8.0f];
  [self.view.layer setCornerRadius:20.0f];
  self.view.layer.masksToBounds=YES;
  
  _yesButton.buttonColor = [UIColor turquoiseColor];
  _yesButton.shadowColor = [UIColor greenSeaColor];
  _yesButton.shadowHeight = 3.0f;
  _yesButton.cornerRadius = 6.0f;
  _yesButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
  [_yesButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
  [_yesButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

  _noButton.buttonColor = [UIColor tangerineColor];
  _noButton.shadowColor = [UIColor carrotColor];
  _noButton.shadowHeight = 3.0f;
  _noButton.cornerRadius = 6.0f;
  _noButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
  [_noButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
  [_noButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
  
}

- (IBAction)yesTapped:(id)sender {
}

- (IBAction)noTapped:(id)sender {
}


@end
