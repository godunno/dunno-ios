//
//  ClassViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDClassViewController.h"
#import "DUNEvent.h"
#import "PDClassViewCell.h"
#import "PDClassFooterView.h"
#import "PDDefaultHeaderView.h"
#import "UIColor+Dunno.h"

@interface PDClassViewController ()

@end

@implementation PDClassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // initialize event list
    _eventList = [[NSMutableArray alloc] init];

    // default light gray background
    self.collectionView.backgroundColor = UIColorFromRGB(0xf2f2f2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_eventList count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // load cell
    PDClassViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PDClassCell" forIndexPath:indexPath];
    
    // load event
    DUNEvent *event = [_eventList objectAtIndex:indexPath.row];
    
    //TODO: cor virá no json
    // set event card top color
    if (event.course.order == 1) {
        cell.topView.backgroundColor = [UIColor dunnoSchema1];
    }
    else if (event.course.order == 2) {
        cell.topView.backgroundColor = [UIColor dunnoSchema2];
    }
    else if (event.course.order == 3) {
        cell.topView.backgroundColor = [UIColor dunnoSchema3];
    }
    else if (event.course.order == 4) {
        cell.topView.backgroundColor = [UIColor dunnoSchema4];
    }
    
    // configure cell
    cell.classNameLabel.text = event.course.className;
    cell.institutionLabel.text = event.course.institution;
    cell.nameLabel.text = event.course.name;
    cell.classOrderLabel.text = [NSString stringWithFormat:@"Aula %d", event.order];

    // date formatting
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"dd"];
    cell.dayLabel.text = [formatter stringFromDate:event.startAt];
    [formatter setDateFormat:@"MMMM"];
    cell.monthLabel.text = [formatter stringFromDate:event.startAt];
    [formatter setDateFormat:@"EEE - HH:mm'h'"];
    cell.scheduleLabel.text = [formatter stringFromDate:event.startAt];
    
    return cell;
}

//- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//    UICollectionReusableView *view = nil;
//    
//    if (kind == UICollectionElementKindSectionHeader) {
//        PDDefaultHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PDDefaultHeaderView" forIndexPath:indexPath];
//        view = headerView;
//    }
//    
//    return view;
//}

#pragma mark - Data

- (void)reloadWithData:(NSMutableArray *)data {
    _eventList = [NSMutableArray arrayWithArray:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
        [self.collectionView layoutIfNeeded];
        
    });
}

- (void)clearData {
    [self reloadWithData:[[NSMutableArray alloc] init]];
}

@end
