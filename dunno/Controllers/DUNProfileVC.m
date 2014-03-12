#import "DUNProfileVC.h"
#import "DUNTimelineTVC.h"
#import "DUNEventCell.h"

#import "DUNStudent.h"

#import "DUNAPI.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <HexColors/HexColor.h>

@interface DUNProfileVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *revealSideMenuButton;

@property (weak, nonatomic) IBOutlet UIView *profileContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *organizationNameLabel;

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@property (strong, nonatomic) DUNSession *session;


@end


@implementation DUNProfileVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  
  [self setupProfileView];
  
  [self setupEventsTable];
  
}

////////////////////////////////////////////////////////////
#pragma mark - Initializers
////////////////////////////////////////////////////////////

- (void) setupProfileView
{
  _organizationNameLabel.text = _session.currentStudent.organization.name;

  self.eventsTableView.backgroundColor = [DUNStyles menuBackgroundColor];
  self.profileContainerView.backgroundColor = [DUNStyles backgroundColor];
  
  DUNStudent *user = [DUNSession sharedInstance].currentStudent;
  [self.profileImage setImageWithURL:[NSURL URLWithString:user.avatarURLString]];
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
  return _session.currentOrganization.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"EventsCellId";
  DUNEventCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  DUNEvent *event = [_session.currentOrganization.events objectAtIndex:indexPath.row];
  
  cell.cellIcon.image = [UIImage imageNamed:@"add_event_live"];
  cell.eventTitleLabel.text = event.title;
  cell.teacherNameLabel.text = event.teacher.name;
  cell.profileImage.image = [UIImage imageNamed:event.teacher.avatarURLString];
  cell.dateLabel.text = @"13/08";
  cell.timeLabel.text = @"24:00";
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  DUNEvent *event = [_session.currentOrganization.events objectAtIndex:indexPath.row];

  [self attendEvent:event];
}

#pragma mark - Private methods

- (void) attendEvent:(DUNEvent*)event
{
  NSParameterAssert(event!=nil);
  NSParameterAssert(_session.currentOrganization!=nil);
  
  [DUNAPI attendEventWithUUID:event.uuid onOrganizationWithUUID:_session.currentOrganization.uuid success:^(DUNEvent *event) {
    
    _session.currentEvent = event;
    
    DUNTimelineTVC *tvc = [self.storyboard instantiateViewControllerWithIdentifier:kDUNTimelineTVCStoryboardId];
    [self.navigationController pushViewController:tvc animated:YES];
    
  } error:^(NSError *error) {
    [DUNErrorVC showWithTitle:@"Participar do Evento" andMessage:@"Não foi possíve participar desse Evento."];    
  }];
  
}

@end
