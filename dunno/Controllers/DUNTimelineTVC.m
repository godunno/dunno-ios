#import "DUNTimelineTVC.h"
#import "DUNTimelineStartPointCell.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineEndPointCell.h"
#import "DUNPollVC.h"
#import "DUNNewMessageVC.h"

#import "DUNTopic.h"

#import "UIViewController+MJPopupViewController.h"
#import "UIColor+FlatUI.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UINavigationBar+FlatUI.h"

@interface DUNTimelineTVC () <DUNNewMessageDelegate>

@property (nonatomic, strong) DUNEvent *event;
@property (strong, nonatomic) DUNSession *session;

@end

@implementation DUNTimelineTVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  _event = _session.currentEvent;
  
  self.navigationController.navigationBar.topItem.title = @"";
}

- (IBAction)sendNewMessage:(id)sender {
  DUNNewMessageVC *newMessageVC = [[DUNNewMessageVC alloc] initWithNibName:kDUNNewMessageVCNibName bundle:nil];
  [newMessageVC setModalInPopover:TRUE];
  newMessageVC.delegate = self;
  [self presentPopupViewController:newMessageVC animationType:MJPopupViewAnimationSlideTopBottom];
}

- (IBAction)showFakePoll:(id)sender {
  DUNPollVC *pollVC = [[DUNPollVC alloc] initWithNibName:kDUNPollVCNibName bundle:nil];
  [pollVC setModalInPopover:TRUE];
//  pollVC.delegate = self;
  [self presentPopupViewController:pollVC animationType:MJPopupViewAnimationSlideTopBottom];
}


//------------------------------------
#pragma mark UITableViewDelegate
//------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if(!_event.timeline || !_event.timeline.messages)
  {
    return 0;
  }
  
  return [self countCells];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(indexPath.row==0)
  {
    DUNTimelineStartPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimelineStartPointCellId forIndexPath:indexPath];
    
    if(_event.topics.count == 0){ // start point
      cell.messageText.text = @"Evento sem tópico específico - Tema livre";
    } else {
      __block NSString *topicsString = @"Tópicos do evento: \n\n";
      [_event.topics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        DUNTopic *topic =(DUNTopic*)_event.topics[idx];
        topicsString = [topicsString stringByAppendingString:[@"\u2022 " stringByAppendingString:[topic.title stringByAppendingString:@"\n"]]];
      }];
      cell.messageText.text = topicsString;
      cell.startHour.text = _event.timeline.startAt.description;
    }
    
    return cell;
    
  } else if(indexPath.row==[self countCells]) { // end point
    DUNTimelineEndPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimelineEndPointCellId forIndexPath:indexPath];
    return cell;
  }
  
  DUNTimelineMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimelineMessageCellId forIndexPath:indexPath];
  [cell setUserMessage:[self messageAtIndex:indexPath.row]];
  
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 150;
}

// ------------------------------
#pragma mark DUNNewMessageDelegate
// ------------------------------
- (void)messageSent:(DUNTimelineUserMessage *)message
{
  [_session.currentEvent.timeline.messages addObject:message];
  
  [self.tableView reloadData];
  
  [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}

// ------------------------------
#pragma mark Private Methods
// ------------------------------
- (NSInteger) countCells
{
  return _event.timeline.messages.count + 1;
}
- (DUNTimelineUserMessage*) messageAtIndex:(NSInteger)index
{
  return [_event.timeline.messages objectAtIndex:index-1];
}

@end
