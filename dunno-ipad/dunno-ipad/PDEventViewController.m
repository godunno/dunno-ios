//
//  EventViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDEventViewController.h"
#import "DUNEvent.h"
#import "PDEventViewCell.h"
#import "PDClassHeaderView.h"
#import "UIFont+Lato.h"
#import "UIFont+Dunno.h"
#import "UIColor+Dunno.h"
#import "PDSingleEventViewController.h"
#import <DUNAPI.h>
#import "PDActivityMenuViewController.h"
#import "PDClassCodeViewController.h"
#import "PDStudentMenuViewController.h"
#import <DUNStudent.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface PDEventViewController ()

@property (nonatomic, strong) NSArray *weekdayList;
@property (nonatomic, strong) UIPopoverController *activityPopover;
@property (nonatomic, strong) UIPopoverController *menuPopover;
@property (nonatomic, strong) NSMutableArray *studentList;

@end

@implementation PDEventViewController

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

    // configure navigation bar title
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 44)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 21)];
    titleLabel.font = [UIFont latoWithSize:18.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = _course.name;
    [titleView addSubview:titleLabel];

    //TODO: informação redundante?
    // configure navigation bar subtitle
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, 400, 21)];
    subtitleLabel.font = [UIFont latoWithSize:12.0];
    subtitleLabel.textColor = [UIColor whiteColor];
    subtitleLabel.textAlignment = NSTextAlignmentCenter;
    subtitleLabel.text = _course.className;
    [titleView addSubview:subtitleLabel];

    // set title view
    self.navigationItem.titleView = titleView;
    self.navigationController.navigationBar.translucent = NO;
    
    // default background color
    self.collectionView.backgroundColor = UIColorFromRGB(0xf2f2f2);
    
    // add constraints
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:@{@"view": self.collectionView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]-53-|" options:0 metrics:nil views:@{@"view": self.collectionView}]];

    // configure footer
    UIView *footerView = [[UIView alloc] init];
    footerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //TODO: cor virá do json
    // set footer background color
    if (_course.order == 1) {
        footerView.backgroundColor = [UIColor dunnoSchema1];
    }
    else if (_course.order == 2) {
        footerView.backgroundColor = [UIColor dunnoSchema2];
    }
    else if (_course.order == 3) {
        footerView.backgroundColor = [UIColor dunnoSchema3];
    }
    else if (_course.order == 4) {
        footerView.backgroundColor = [UIColor dunnoSchema4];
    }

    //TODO: informação redundante com a barra superior?
    // configure class name
    UILabel *classNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 16, 780, 21)];
    classNameLabel.font = [UIFont latoWithSize:18.0];
    classNameLabel.text = _course.className;
    [footerView addSubview:classNameLabel];
    
    // set code
    UILabel *codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(865, 16, 140, 21)];
    codeLabel.font= [UIFont latoWithSize:18.0];
    codeLabel.textAlignment = NSTextAlignmentRight;
    codeLabel.text = [NSString stringWithFormat:@"[ %@ ]", _course.accessCode];
    codeLabel.userInteractionEnabled = YES;
    [codeLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCode)]];
    [footerView addSubview:codeLabel];
    
    // add subview
    [self.view addSubview:footerView];
    
    // add constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:@{@"view": footerView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top][view]|" options:0 metrics:nil views:@{@"view": footerView, @"top": self.collectionView}]];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // load events
    [[DUNAPI sharedInstance] loadTeacherCourseWithUuid:_course.uuid success:^(DUNCourse *result) {
        _eventList = result.events;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } error:^(NSError *error) {
        //TODO: handle error
        _eventList = [[NSMutableArray alloc] init];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];

    // initialize internal lists
    _weekdayList = @[@"SEG", @"TER", @"QUA", @"QUI", @"SEX", @"SAB", @"DOM"];
    _studentList = [[NSMutableArray alloc] init];
    
    // configure student button at top right
    UIButton *studentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    studentButton.frame = CGRectMake(0, 0, 40, 20);
    [studentButton setTitle:@"H" forState:UIControlStateNormal];
    studentButton.titleLabel.font = [UIFont dunnoWithSize:21.0];
    studentButton.titleLabel.textColor = [UIColor whiteColor];
    [studentButton addTarget:self action:@selector(showStudentPopover:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:studentButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    
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

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // load cell
    PDEventViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PDEventCell" forIndexPath:indexPath];
    
    // load event
    DUNEvent *event = (DUNEvent*)[_eventList objectAtIndex:indexPath.row];
    
    // date formatting
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"dd"];
    cell.dayLabel.text = [formatter stringFromDate:event.startAt];
    
    [formatter setDateFormat:@"MMMM"];
    cell.monthLabel.text = [formatter stringFromDate:event.endAt];
    
    [formatter setDateFormat:@"EEE - HH:mm'h'"];
    cell.scheduleLabel.text = [formatter stringFromDate:event.startAt];

    // configure cell
    cell.classNumberLabel.text = [NSString stringWithFormat:@"Aula %d", indexPath.row+1];
    
    return cell;
}

//- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    UICollectionReusableView *view = nil;
//    
//    if (kind == UICollectionElementKindSectionHeader) {
//        PDClassHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PDClassHeaderView" forIndexPath:indexPath];
//        
//        headerView.titleLabel.text = _course.className;
//        headerView.subtitleLabel.text = _course.className;
//        
//        view = headerView;
//    }
//    else if (kind == UICollectionElementKindSectionFooter) {
//        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"PDClassFooterView" forIndexPath:indexPath];
//    }
//    
//    return view;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // configure view controller
    PDSingleEventViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PDSingleEventController"];
    viewController.course = _course;
    
    // load single event
    DUNEvent *event = (DUNEvent*)[_eventList objectAtIndex:indexPath.row];
    [[DUNAPI sharedInstance] loadTeacherEventWithUuid:event.uuid success:^(DUNEvent *result) {
        viewController.event = result;
        viewController.eventIndex = indexPath.row;
        [self.navigationController pushViewController:viewController animated:YES];        
    } error:^(NSError *error) {
        //TODO: handle error
    }];
}

- (void)showStudentPopover:(id)sender {

    // dismiss if visible
    if ([_menuPopover isPopoverVisible]) {
        [_menuPopover dismissPopoverAnimated:NO];
    }

    // load student list
    [[DUNAPI sharedInstance] loadTeacherCourseStudentsWithUuid:_course.uuid success:^(NSMutableArray *results) {
        // configure popover
        PDStudentMenuViewController *popover = [self.storyboard instantiateViewControllerWithIdentifier:@"PDStudentMenuViewController"];
        _studentList = [NSMutableArray arrayWithArray:results];
        popover.studentList = [NSMutableArray arrayWithArray:results];
        _menuPopover = [[UIPopoverController alloc] initWithContentViewController:popover];
        
        // show
        [_menuPopover presentPopoverFromRect:CGRectMake(973, 0, 30, 30) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    } error:^(NSError *error) {
        //TODO: handle error
    }];
    
}

- (void)showCode {
    // show fullscreen class code
    PDClassCodeViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PDClassCodeViewController"];
    viewController.classCode = _course.accessCode;
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
