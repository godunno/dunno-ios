
#define kTimelineEndPointCellId @"DUNTimelineEndPointCellId"

@interface DUNTimelineEndPointCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *timelineCellBackground;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UITextView *messageText;

@end
