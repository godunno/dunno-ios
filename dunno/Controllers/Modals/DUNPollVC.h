#import "DUNDismissModalVCDelegate.h"

#define kDUNPollVCNibName @"DUNPollVC"

@interface DUNPollVC : UIViewController

@property (nonatomic, weak) id<DUNDismissModalVCDelegate> ownerViewController;

@end
