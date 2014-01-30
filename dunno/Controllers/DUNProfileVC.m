#import "DUNProfileVC.h"
#import "SWRevealViewController.h"

@interface DUNProfileVC ()
@property (nonatomic, weak) IBOutlet UIBarButtonItem *revealSideMenuButton;

@end

@implementation DUNProfileVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [DUNStyles backgroundColor];
  
  
  _revealSideMenuButton.target = self.revealViewController;
  _revealSideMenuButton.action = @selector(revealToggle:);
  [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

@end
