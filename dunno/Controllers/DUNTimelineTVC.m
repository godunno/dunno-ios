#import "DUNTimelineTVC.h"
#import "DUNTimelineStartPointCell.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineEndPointCell.h"
#import "DUNPollVC.h"
#import "DUNNewMessageVC.h"
#import "DUNThermometerTVC.h"

#import "DUNTopic.h"

#import "DUNPusher.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIViewController+MJPopupViewController.h"
#import "UIColor+FlatUI.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UINavigationBar+FlatUI.h"

@interface DUNTimelineTVC () <DUNNewMessageDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) DUNEvent *event;
@property (strong, nonatomic) DUNSession *session;

@end

@implementation DUNTimelineTVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  _event = _session.currentEvent;
  
  [self registerPusherEvents];
  
  self.navigationController.navigationBar.topItem.title = @"";
}

//------------------------------------------------
# pragma mark - Pusher events..
//------------------------------------------------
- (void) registerPusherEvents
{
  NSParameterAssert(_event!=nil);
  NSParameterAssert(_event.studentMessageEvent!=nil);
  NSParameterAssert(_event.upDownVoteMessageEvent!=nil);
  NSParameterAssert(_event.closeEvent!=nil);
  
  DUNPusher *pusher = [DUNPusher sharedInstance].connect;
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.studentMessageEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    DUNTimelineUserMessage *newMessage = [[DUNTimelineUserMessage alloc] initWithDictionary:jsonDictionary error:nil];
    
    [_session.currentEvent.timeline.messages addObject:newMessage];
    if(![newMessage.owner.entityId isEqualToString:_session.currentStudent.entityId]){
      return;
    }else {
      [self.tableView reloadData];
    }
    
  }];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.upDownVoteMessageEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    DUNTimelineUserMessage *messageVoted = [[DUNTimelineUserMessage alloc] initWithDictionary:jsonDictionary error:nil];
    
    [_session.currentEvent.timeline updateMessage:messageVoted];
    
    [self.tableView reloadData];
    
  }];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.closeEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    DUNEvent *eventClosed = [[DUNEvent alloc] initWithDictionary:jsonDictionary error:nil];
    // TODO update _session.currentEvent - close it and refresh events list at previous ViewController
    
    
    if(_session.currentEvent.thermometers!=nil && [_session.currentEvent.thermometers count] > 0)
    {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"A aula foi finalizada pelo Professor. Vamos a avaliação dos tópicos?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
      [alert show];
    } else {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"A aula foi finalizada pelo Professor." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
      [alert show];
    }
    
    // TODO when finish thermometers, redirect to events list or offline timeline..
    
  }];
}

//------------------------------------------------
#pragma mark - interactions
//------------------------------------------------

- (IBAction)sendNewMessage:(id)sender {
  
  //TODO hide button when event is closed
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
#pragma mark UIAlertViewDelegate
//------------------------------------
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  DUNThermometerTVC *thermometersVC =   [self.storyboard instantiateViewControllerWithIdentifier:kDUNThermometerTVCStoryboardId];
  thermometersVC.event = _event;
  [self.navigationController pushViewController:thermometersVC animated:YES];
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
    
    [cell.profilePicture setImageWithURL:[NSURL URLWithString:_event.teacher.avatarURLString]];
    
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
