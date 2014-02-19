#import "DUNDismissModalVCDelegate.h"

#define kDUNNewMessageVCNibName @"DUNNewMessageVC"

@interface DUNNewMessageVC : UIViewController

@property (nonatomic, weak) id<DUNDismissModalVCDelegate> ownerViewController;

@end
