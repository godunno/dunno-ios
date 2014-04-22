#import "DUNTimelineTVC.h"
#import "DUNTimelineStartPointCell.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineEndPointCell.h"
#import "DUNPollVC.h"
#import "DUNNewMessageVC.h"
#import "DUNThermometerTVC.h"
#import "DUNPoll.h"
#import "DUNMedia.h"
#import "DUNTopic.h"
#import "DUNEvent.h"
#import "DUNTimeline.h"
#import "DUNStudent.h"
#import "DUNTeacher.h"
#import "DUNCourse.h"

#import "DUNPusher.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIViewController+MJPopupViewController.h"
#import "UIColor+FlatUI.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UINavigationBar+FlatUI.h"

#define kReleasePollTag 100
#define kReleaseMediaTag 200
#define kCloseEventTag 300

@interface DUNTimelineTVC () <DUNNewMessageDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) DUNSession *session;

@end

@implementation DUNTimelineTVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  
  [self registerPusherEvents];
  
  _session.activeEvent = _event;
  
  self.navigationController.navigationBar.topItem.title = @"";
}

-(void) viewWillDisappear:(BOOL)animated {
  
  //when press back button, clear active event..
  if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
    [_session clearActiveEvent];
  }
  [super viewWillDisappear:animated];
}

# pragma mark - Pusher events..
- (void) registerPusherEvents
{
  NSParameterAssert(_event!=nil);
  NSParameterAssert(_event.studentMessageEvent!=nil);
  NSParameterAssert(_event.upDownVoteMessageEvent!=nil);
  NSParameterAssert(_event.releasePollEvent!=nil);
  NSParameterAssert(_event.closeEvent!=nil);
  
  DUNPusher *pusher = [DUNPusher sharedInstance];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.studentMessageEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *newMessage = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:jsonDictionary error:&error];
    
#if DEBUG
    NSAssert(error==nil, @"Error parsing JSON to DUNTimelineUserMessage on send Message to Timeline Pusher response");
#else
    //TODO show error on modal dialog?
#endif
    
    /**
     * instead control update timeline here and when POST new message, use Observer pattern.
     */
    [_session.activeEvent.timeline.messages addObject:newMessage];
    if(newMessage.owner.entityId != _session.currentStudent.entityId){
      return;
    }else {
      [self.tableView reloadData];
    }
    
  }];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.upDownVoteMessageEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    NSError *error = nil;
    DUNTimelineUserMessage *messageVoted = [MTLJSONAdapter modelOfClass:DUNTimelineUserMessage.class fromJSONDictionary:jsonDictionary error:&error];
    
#if DEBUG
    NSAssert(error==nil, @"Error parsing JSON to DUNTimelineUserMessage on up/down vote Pusher response");
#else
    //TODO show error on modal dialog?
#endif
    
    [_session.activeEvent.timeline updateMessage:messageVoted];
    
    [self.tableView reloadData];
    
  }];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.releasePollEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    NSError *error = nil;
    DUNPoll *poll = [MTLJSONAdapter modelOfClass:DUNPoll.class fromJSONDictionary:jsonDictionary error:&error];
    
#if DEBUG
    NSAssert(error==nil, @"Error parsing JSON to DUNPoll on receive Poll Pusher response");
#else
    //TODO show error on modal dialog?
#endif
    
    [self showPoll:poll];
  }];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.releaseMediaEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    NSError *error = nil;
    DUNMedia *media = [MTLJSONAdapter modelOfClass:DUNMedia.class fromJSONDictionary:jsonDictionary error:&error];
    
#if DEBUG
    NSAssert(error==nil, @"Error parsing JSON to DUNPoll on receive Poll Pusher response");
#else
    //TODO show error on modal dialog?
#endif
    
    [self showMedia:media];
  }];
  
  [pusher subscribeToChannelNamed:_event.channelName withEventNamed:_event.closeEvent handleWithBlock:^(NSDictionary *jsonDictionary) {
    
    NSError *error = nil;
    DUNEvent *eventClosed = [MTLJSONAdapter modelOfClass:DUNEvent.class fromJSONDictionary:jsonDictionary error:&error];
    
#if DEBUG
    NSAssert(error==nil, @"Error parsing JSON to DUNEvent on finish Event Pusher response");
#else
    //TODO show error on modal dialog?
#endif
    
    // TODO update _session.currentEvent - close it and refresh events list at previous ViewController
    
    if(_session.activeEvent.thermometers!=nil && [_session.activeEvent.thermometers count] > 0)
    {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"A aula foi finalizada pelo Professor. Vamos a avaliação dos tópicos?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
      alert.tag = kCloseEventTag;
      [alert show];
    } else {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"A aula foi finalizada pelo Professor." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
      alert.tag = kCloseEventTag;
      [alert show];
    }
    
    // TODO when finish thermometers, redirect to events list or offline timeline..
    
  }];
}


#pragma mark - Interactions

- (IBAction)sendNewMessage:(id)sender {
  DUNNewMessageVC *newMessageVC = [[DUNNewMessageVC alloc] initWithNibName:kDUNNewMessageVCNibName bundle:nil];
  [newMessageVC setModalInPopover:TRUE];
  newMessageVC.delegate = self;
  [self presentPopupViewController:newMessageVC animationType:MJPopupViewAnimationSlideBelowNavbarTop];
}

- (void)showPoll:(DUNPoll*)poll {
  NSParameterAssert(poll!=nil);
  
  if([self.mj_popupViewController isViewLoaded])
  {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
  }
  
  //TODO verify if already exists poll active..
  _session.currentPoll = poll;
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Professor enviou uma enquete, vamos lá?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
  alert.tag = kReleasePollTag;
  [alert show];
}

- (void) showMedia:(DUNMedia*)media
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Professor enviou conteúdo rico, quer visualizar?" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
  alert.tag = kReleaseMediaTag;
  [alert show];
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  if (alertView.tag == kCloseEventTag) {
    DUNThermometerTVC *thermometersVC =   [self.storyboard instantiateViewControllerWithIdentifier:kDUNThermometerTVCStoryboardId];
    thermometersVC.event = _event;
    [self.navigationController pushViewController:thermometersVC animated:YES];
  }else if(alertView.tag == kReleasePollTag)
  {
    DUNPollVC *pollVC = [self.storyboard instantiateViewControllerWithIdentifier:kDUNPollVCStoryboardId];
    [self.navigationController pushViewController:pollVC animated:YES];
  }else if(alertView.tag == kReleaseMediaTag)
  {
    NSLog(@"show rich content..");
  }
  
}

#pragma mark UITableViewDelegate

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
    
    [cell.profilePicture setImageWithURL:[NSURL URLWithString:_event.course.teacher.avatarURLString]];
    
    if(_event.topics.count == 0){ // start point
      cell.messageText.text = @"Evento sem tópico específico - Tema livre";
    } else {
      __block NSString *topicsString = @"Tópicos do evento: \n\n";
      [_event.topics enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        DUNTopic *topic =(DUNTopic*)_event.topics[idx];
        topicsString = [topicsString stringByAppendingString:[@"\u2022 " stringByAppendingString:[topic.title stringByAppendingString:@"\n"]]];
      }];
      cell.messageText.text = topicsString;
      cell.startHour.text = _event.timeline.startedAt.description;
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


#pragma mark DUNNewMessageDelegate

- (void)messageSent:(DUNTimelineUserMessage *)message
{
  [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}

#pragma mark Private Methods

- (NSInteger) countCells
{
  return _event.timeline.messages.count + 1;
}
- (DUNTimelineUserMessage*) messageAtIndex:(NSInteger)index
{
  return [_event.timeline.messages objectAtIndex:index-1];
}

@end
