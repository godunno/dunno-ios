#import "DUNThermometerTVC.h"
#import "DUNThermometerCell.h"

@implementation DUNThermometerTVC

- (void)viewDidLoad
{
  [super viewDidLoad];
}


//------------------------------------
#pragma mark UITableViewDelegate
//------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if(_event==nil || _event.thermometers==nil)
  {
    return 0;
  }
  
  return [_event.thermometers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  DUNThermometerCell *cell = [tableView dequeueReusableCellWithIdentifier:kThermometerCell forIndexPath:indexPath];
  DUNThermometer *thermometer = [_event.thermometers objectAtIndex:indexPath.row];
  
  cell.questionTextView.text = thermometer.content;
  
  return cell;

}


@end
