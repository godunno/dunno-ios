#import "DUNTimelineTVC.h"
#import "DUNTimelineStartPointCell.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineEndPointCell.h"

@interface DUNTimelineTVC ()
@end

@implementation DUNTimelineTVC

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
