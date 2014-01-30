#import "DUNProfileVC.h"
#import "SWRevealViewController.h"
#import "DUNEventCell.h"
#import "DUNUser.h"

@interface DUNProfileVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *revealSideMenuButton;

@property (weak, nonatomic) IBOutlet UIView *profileContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@end


@implementation DUNProfileVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self setupProfileView];
  
  [self configureSideMenu];
  
  [self setupEventsTable];
}

////////////////////////////////////////////////////////////
#pragma mark - Initializers
////////////////////////////////////////////////////////////

- (void) setupProfileView
{
  self.eventsTableView.backgroundColor = [DUNStyles menuBackgroundColor];
  self.profileContainerView.backgroundColor = [DUNStyles backgroundColor];
  //customize interface
  
  DUNUser *user = [DUNSession sharedInstance].currentUser;
  
  //define values
}

- (void) configureSideMenu
{
  _revealSideMenuButton.target = self.revealViewController;
  _revealSideMenuButton.action = @selector(revealToggle:);
  [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void) setupEventsTable
{
  _eventsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  _eventsTableView.delegate = self;
  _eventsTableView.dataSource  = self;
}

////////////////////////////////////////////////////////////
#pragma mark - UITableViewDelegate
////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"EventsCellId";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  return cell;
}

////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource
////////////////////////////////////////////////////////////

@end
