//
//  DUNTimelineVC.m
//  dunno
//
//  Created by fagner feitosa on 1/22/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNTimelineVC.h"
#import "DUNTimelineMessageCell.h"
#import "DUNTimelineUserMessage.h"

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
  message.message = @"teste mensagem";
  
  [self.timelineItems addObject:message];
  
  [self.timelineCollectionView reloadData];
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
