//
//  CourseViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDCourseViewController.h"
#import "DUNCourse.h"
#import "DUNSchedule.h"
#import "PDCourseViewCell.h"
#import "UIFont+Lato.h"
#import "PDEventViewController.h"
#import "UIColor+Dunno.h"
#import "PDDefaultHeaderView.h"

@interface PDCourseViewController ()

@property (nonatomic, strong) NSArray *weekdayList;
@property (nonatomic, strong) NSArray *schemaList;

@end

@implementation PDCourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _courseList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // default background color
    self.collectionView.backgroundColor = UIColorFromRGB(0xf2f2f2);
    
    // initialize internal lists
    _weekdayList = @[@"SEG", @"TER", @"QUA", @"QUI", @"SEX", @"SAB", @"DOM"];
    _schemaList = @[@"fedd59", @"0x54c5ff", @"0xff926a", @"0xa893ff"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_courseList count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // load cell
    PDCourseViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PDCourseCell" forIndexPath:indexPath];
    
    // load course
    DUNCourse *course = (DUNCourse*)[_courseList objectAtIndex:indexPath.row];
    
    //TODO: cor virá no json
    // set course card top color
    if (course.order == 1) {
        cell.topView.backgroundColor = [UIColor dunnoSchema1];
    }
    else if (course.order == 2) {
        cell.topView.backgroundColor = [UIColor dunnoSchema2];
    }
    else if (course.order == 3) {
        cell.topView.backgroundColor = [UIColor dunnoSchema3];
    }
    else if (course.order == 4) {
        cell.topView.backgroundColor = [UIColor dunnoSchema4];
    }
    
    // configure cell
    cell.nameLabel.text = course.name;
    cell.classNameLabel.text = course.className;
    cell.locationLabel.text = course.institution;
    
    // date formatting
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"dd MMMM"];
    cell.periodLabel.text = [NSString stringWithFormat:@"%@ - %@", [formatter stringFromDate:course.startDate], [formatter stringFromDate:course.endDate]];
    cell.studentCountLabel.text = [NSString stringWithFormat:@"%u Aluno%@", [course.students count], [course.students count] > 1 ? @"s" : @""];
    
    // load schedule list
    for (DUNSchedule *schedule in course.weeklySchedules){
        
        // get target view for weekday
        UIView *targetView = (UIView*)[cell.timeList objectAtIndex:schedule.weekday];
        int targetCount = [[targetView subviews] count]-1;
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(targetCount*96, 0, 90, 21)];

        // create label
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 80, 19)];
        dayLabel.font = [UIFont latoWithSize:13.0];
        dayLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.61];
        
        // date formatting
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
        [formatter setDateFormat:@"EEE"];
        dayLabel.text = [NSString stringWithFormat:@"%@-%@", schedule.startTime, schedule.endTime];
        
        // add subviews
        [backView addSubview:dayLabel];
        [targetView addSubview:backView];
        
        // set gray background if has any schedule
        UIView *dayView = (UIView *)[cell.weekdayList objectAtIndex:schedule.weekday];
        dayView.backgroundColor = [UIColor lightGrayColor];
    }
    
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // load course
    DUNCourse *course = (DUNCourse*)[_courseList objectAtIndex:indexPath.row];
    
    // notify main viewcontroller
    [_delegate didSelectCourse:course];
}

- (void)reloadWithData:(NSMutableArray *)data {
    _courseList = [NSMutableArray arrayWithArray:data];
    NSLog(@"reloadWithData: %d", [data count]);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
        [self.collectionView layoutIfNeeded];
        
    });
}

- (void)clearData {
    [self reloadWithData:[[NSMutableArray alloc] init]];
}

@end
