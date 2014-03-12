#import "DUNErrorVC.h"

#import "UIViewController+MJPopupViewController.h"

@implementation DUNErrorVC

+ (instancetype) showWithTitle:(NSString*)title andMessage:(NSString*)message
{
  UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
  
  DUNErrorVC *errorVC = [[DUNErrorVC alloc] initWithNibName:kDUNErrorVCNibName bundle:nil];
  errorVC.messageTitle = title;
  errorVC.message = message;
  [errorVC setModalInPopover:TRUE];
  [topController presentPopupViewController:errorVC animationType:MJPopupViewAnimationSlideTopBottom];
  
  return errorVC;
}
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _titleLabel.text = _messageTitle;
  _messageTextView.text = _message;
}

@end
