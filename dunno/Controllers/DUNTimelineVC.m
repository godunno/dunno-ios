#import "DUNTimelineVC.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineUserMessage.h"

#import "UIViewController+CWPopup.h"
#import "DUNPollModalVC.h"
#import "DUNTimelinePoll.h"

@interface DUNTimelineVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *timelineItems;
@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UICollectionView *timelineCollectionView;

@end

@implementation DUNTimelineVC


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.timelineItems = [[NSMutableArray alloc] init];
  
  self.timelineCollectionView.delegate = self;
  self.timelineCollectionView.dataSource = self;
  
}

- (IBAction)addNewMessage:(id)sender {
  DUNTimelineUserMessage *message = [DUNTimelineUserMessage new];
  message.message = @"teste mensagem\nteste mensagem\nteste mensagem";
  
  [self.timelineItems addObject:message];
  
  [self.timelineCollectionView reloadData];
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

////////////////////////////////////////////////////////////
#pragma mark - CollectionView DataSource
////////////////////////////////////////////////////////////

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.timelineItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  DUNTimelineMessageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DUNTimelineMessageCellReuseId" forIndexPath:indexPath];
  
  cell.userMessage = [self.timelineItems objectAtIndex:indexPath.row];
  return cell;
}

@end
