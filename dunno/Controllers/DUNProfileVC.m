#import "DUNProfileVC.h"
#import "DUNTimelineTVC.h"
#import "SWRevealViewController.h"
#import "DUNEventCell.h"

#import "DUNTeacher.h"

#import "DUNAPI.h"

#import <HexColors/HexColor.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface DUNProfileVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *revealSideMenuButton;

@property (weak, nonatomic) IBOutlet UIView *profileContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@property (strong, nonatomic) DUNSession *session;
@property (strong, nonatomic) NSArray *events;

@end


@implementation DUNProfileVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  
  [self setupProfileView];
  
  [self configureSideMenu];
  
  [self loadEvents];
  
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
  
  DUNTeacher *user = [DUNSession sharedInstance].currentUser;
  
  //define values
}

- (void) configureSideMenu
{
  _revealSideMenuButton.target = self.revealViewController;
  _revealSideMenuButton.action = @selector(revealToggle:);
  [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void) loadEvents
{
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  hud.mode = MBProgressHUDModeIndeterminate;
  hud.labelText = @"Carregando eventos";
  
  [DUNAPI eventsAvailableToOrganization:_session.currentOrganization success:^(NSArray *events) {
    _events = events;
    
    [_eventsTableView reloadData];
    
    [hud hide:YES];
  } error:^(NSError *error) {
    //TODO show generic 'modal'/'view' with error
    [hud hide:YES];
  }];
  
  _events = [NSArray array];
  
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
  return _events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"EventsCellId";
  DUNEventCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  DUNEvent *event = [_events objectAtIndex:indexPath.row];

  if([event isOpen])
  {
    cell.contentView.backgroundColor = [UIColor colorWithHexString:@"abcede"];
    cell.cellIcon.image = [UIImage imageNamed:@"add_event_live"];
  } else if([event isClosed])
  {
    cell.contentView.backgroundColor = [UIColor colorWithHexString:@"e0c7c4"];
    cell.cellIcon.image = [UIImage imageNamed:@"closed_event"];
    [cell.eventTitleLabel setAlpha:0.5];
    [cell.teacherNameLabel setAlpha:0.5];
    [cell.profileImage setAlpha:0.5];
  } else
  {
    cell.cellIcon.image = [UIImage imageNamed:@"add_event"];    
  }
  
  cell.eventTitleLabel.text = event.title;
  cell.teacherNameLabel.text = event.teacher.name;

  //cell.profileImage.image = event.teacher.pictureURLString;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  DUNTimelineTVC *tvc = [self.storyboard instantiateViewControllerWithIdentifier:kDUNTimelineTVCStoryboardId];
  tvc.event = [_events objectAtIndex:indexPath.row];
  [self.navigationController pushViewController:tvc animated:YES];
}

@end
