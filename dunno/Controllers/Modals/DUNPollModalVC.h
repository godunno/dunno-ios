#import <UIKit/UIKit.h>
#import "DUNTimelinePoll.h"


#define kDUNPollModalXibName @"DUNPollModalVC"

@interface DUNPollModalVC : UIViewController

@property (nonatomic, strong) DUNTimelinePoll *poll;

@property (nonatomic, weak) UIViewController *presentingVC;

@end
