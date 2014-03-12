#define kDUNErrorVCNibName @"DUNErrorVC"

@interface DUNErrorVC : UIViewController

@property (nonatomic, copy) NSString *messageTitle;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextView *messageTextView;

+ (instancetype) showWithTitle:(NSString*)title andMessage:(NSString*)message;

@end
