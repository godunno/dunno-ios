#import "DUNEventCell.h"
#import <HexColors/HexColor.h>
#import "NSDate+Calendar.h"

@interface DUNEventCell()

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomMarginView;
@property (weak, nonatomic) IBOutlet UIImageView *cellIcon;

@end

@implementation DUNEventCell

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  self.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
  self.bottomMarginView.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
  
  self.eventTitleLabel.textColor = [DUNStyles backgroundColor];
  
  self.teacherNameLabel.textColor = [UIColor colorWithHexString:@"e74c3c"];
}


- (void) setEvent:(DUNEvent*)event
{
  _cellIcon.image = [UIImage imageNamed:@"add_event_live"];
  _eventTitleLabel.text = event.title;
  _teacherNameLabel.text = event.teacher.name;
  _profileImage.image = [UIImage imageNamed:event.teacher.avatarURLString];
  _dateLabel.text = [NSString stringWithFormat:@"%d/%d",event.startAt.day, event.startAt.month];
  _timeLabel.text = [NSString stringWithFormat:@"%d:%d",event.startAt.hour,event.startAt.minute];
}
@end
