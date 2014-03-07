#import "DUNThermometerCell.h"

@implementation DUNThermometerCell

- (void)layoutSubviews
{
  [super layoutSubviews];

  [DUNStyles customizeOKButton:_sendRatingButton];
}

- (IBAction)sendRating:(id)sender
{
  NSLog(@"send thermometer rating");
}

@end
