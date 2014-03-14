#import "DUNTutorialVC.h"
#import "DUNProfileVC.h"

#import <EAIntroView/EAIntroView.h>

#define kTutorialPagesNibName @"DUNTutorialPages"

@interface DUNTutorialVC()<EAIntroDelegate>
@end

@implementation DUNTutorialVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self showTutorial];
}

- (void) showTutorial
{
  
  NSArray *views = [[NSBundle mainBundle] loadNibNamed:kTutorialPagesNibName owner:self options:nil];
  
  EAIntroPage *page1 = [EAIntroPage pageWithCustomView:views[0]];
  EAIntroPage *page2 = [EAIntroPage pageWithCustomView:views[1]];
  EAIntroPage *page3 = [EAIntroPage pageWithCustomView:views[2]];
  
  EAIntroView *container = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
  container.delegate = self;
  
  [container showInView:self.view animateDuration:0.0];
}


+ (bool) hasBeenExhibited
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  return  [defaults objectForKey:kDUNTutorialHasBeenExhibitedUserDefaultsKey];
}

# pragma mark - EAIntroDelegate

- (void)introDidFinish:(EAIntroView *)introView
{
  UINavigationController *initialNVC = [self.storyboard instantiateViewControllerWithIdentifier:kDUNInitialNVC];
  [self presentViewController:initialNVC animated:YES completion:nil];
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:@true forKey:kDUNTutorialHasBeenExhibitedUserDefaultsKey];
}



@end

