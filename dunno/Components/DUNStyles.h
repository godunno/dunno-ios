#import "FUIButton.h"

@interface DUNStyles : NSObject

+ (UIColor*)backgroundColor;
+ (UIColor*)menuBackgroundColor;

+ (FUIButton*) customizeOKButton:(FUIButton*)buttonTemplate;

+ (void) roundView:(UIView*)view;
@end
