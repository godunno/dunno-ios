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

@interface DUNTimelineTVC ()
@end

@implementation DUNTimelineTVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  self.navigationController.navigationBar.topItem.title = @"";
}

- (IBAction)sendNewMessage:(id)sender {
  DUNNewMessageVC *newMessageVC = [[DUNNewMessageVC alloc] initWithNibName:kDUNNewMessageVCNibName bundle:nil];
  [newMessageVC setModalInPopover:TRUE];
  [self presentPopupViewController:newMessageVC animationType:MJPopupViewAnimationSlideTopBottom];
}

- (IBAction)showFakePoll:(id)sender {
  DUNPollVC *pollVC = [[DUNPollVC alloc] initWithNibName:kDUNPollVCNibName bundle:nil];
  [pollVC setModalInPopover:TRUE];
  [self presentPopupViewController:pollVC animationType:MJPopupViewAnimationSlideTopBottom];
}


//------------------------------------
#pragma mark UITableViewDelegate
//------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  NSParameterAssert(_event!=nil);
  NSParameterAssert(_event.timeline!=nil);
  
  return [self countCells];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(indexPath.row==0)
  {
    DUNTimelineStartPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimelineStartPointCellId forIndexPath:indexPath];
    
    if(_event.topics.count == 0){
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
  } else if(indexPath.row==[self countCells]) {
    DUNTimelineEndPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimelineEndPointCellId forIndexPath:indexPath];
    
    return cell;
  }
  
  DUNTimelineMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimelineMessageCellId forIndexPath:indexPath];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 150;
}

// ------------------------------
#pragma mark Private Methods
// ------------------------------
- (NSInteger) countCells
{
  return _event.timeline.interactions.count + 1;
}

@end
