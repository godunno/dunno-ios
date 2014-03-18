#import "DUNStyles.h"

#import "FUIButton.h"
#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"

#import <HexColors/HexColor.h>

@implementation DUNStyles

+ (UIColor*)menuBackgroundColor
{
 return [UIColor colorWithHexString:@"2f2f2f"];
}

+ (UIColor*)backgroundColor
{
  return [UIColor colorWithHexString:@"4a4949"];
}

+ (FUIButton*) customizeOKButton:(FUIButton*)buttonTemplate
{
  buttonTemplate.buttonColor = [UIColor turquoiseColor];
  buttonTemplate.shadowColor = [UIColor greenSeaColor];
  buttonTemplate.shadowHeight = 3.0f;
  buttonTemplate.cornerRadius = 6.0f;
  buttonTemplate.titleLabel.font = [UIFont boldFlatFontOfSize:16];
  [buttonTemplate setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
  [buttonTemplate setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

  return buttonTemplate;
}

+ (void) roundView:(UIView*)view
{
  view.layer.cornerRadius = view.frame.size.width / 2;
  view.layer.borderWidth = 2.0f;
  view.layer.borderColor = [UIColor whiteColor].CGColor;
  view.clipsToBounds = YES;

}

@end
