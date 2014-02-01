#import "DUNTimelineVC.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineUserMessage.h"

#import "UIViewController+CWPopup.h"
#import "DUNPollModalVC.h"
#import "DUNTimelinePoll.h"

@interface DUNTimelineVC ()

@property (nonatomic, strong) NSMutableArray *timelineItems;

@end

@implementation DUNTimelineVC


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.timelineItems = [[NSMutableArray alloc] init];
}

- (IBAction)addNewMessage:(id)sender {
  DUNTimelineUserMessage *message = [DUNTimelineUserMessage new];
  message.message = @"teste mensagem\nteste mensagem\nteste mensagem";
  
  [self.timelineItems addObject:message];
}

- (IBAction)showPoll:(id)sender {
  DUNPollModalVC *pollModalVC = [[DUNPollModalVC alloc] initWithNibName:kDUNPollModalXibName bundle:nil];
  
  DUNTimelinePoll *poll =   [[DUNTimelinePoll alloc] init];
  poll.question = @"onde está wallie?";
  poll.options = @[@"Sim", @"Não"];
  
  pollModalVC.poll = poll;
  pollModalVC.presentingVC = self;
  
  [self presentPopupViewController:pollModalVC animated:YES completion:^(void) {
    
  }];
  
  
}

@end
