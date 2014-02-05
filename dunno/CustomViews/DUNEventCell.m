#import "DUNEventCell.h"
#import <HexColors/HexColor.h>

@implementation DUNEventCell

- (void)setFrame:(CGRect)frame {
  float inset = 0;
  frame.origin.x += inset;
  frame.size.width -= 2 * inset;
  [super setFrame:frame];
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  self.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
  self.bottomMarginView.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
  
  self.eventTitleLabel.textColor = [DUNStyles backgroundColor];
  
  self.teacherNameLabel.textColor = [UIColor colorWithHexString:@"e74c3c"];
  
}
@end
