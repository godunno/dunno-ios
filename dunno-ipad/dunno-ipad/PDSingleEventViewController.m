//
//  SingleEventViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDSingleEventViewController.h"
#import "PDActivityViewCell.h"
#import "PDTimelineViewCell.h"
#import "UIFont+Dunno.h"
#import "UIFont+Lato.h"
#import "UIColor+Dunno.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "PDActivityMenuViewController.h"
#import "DUNTopic.h"
#import <DUNAPI.h>
#import "DUNPersonalNote.h"
#import <DUNMessage.h>
#import "PDClassCodeViewController.h"
#import "PDStudentMenuViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface PDSingleEventViewController ()

@property (nonatomic, strong) NSArray *topicList;
@property (nonatomic, strong) NSArray *personalNoteList;
@property (nonatomic, strong) NSArray *timelineList;

@property (nonatomic, strong) UIPopoverController *activityPopover;
@property (nonatomic, strong) UIPopoverController *menuPopover;
@property (nonatomic, strong) UILongPressGestureRecognizer *longGesture;

@end

@implementation PDSingleEventViewController

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

    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }

    // initialize internal lists
    _topicList = [[NSMutableArray alloc] init];
    _personalNoteList = [[NSMutableArray alloc] init];
    _timelineList = [[NSMutableArray alloc] init];

    // configure title view
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 44)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 21)];
    titleLabel.font = [UIFont latoWithSize:18.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = _course.name;
    [titleView addSubview:titleLabel];
    
    // configure subtitle
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, 400, 21)];
    subtitleLabel.font = [UIFont latoWithSize:12.0];
    subtitleLabel.textColor = [UIColor whiteColor];
    subtitleLabel.textAlignment = NSTextAlignmentCenter;
    subtitleLabel.text =_course.className;
    [titleView addSubview:subtitleLabel];
    
    self.navigationItem.titleView = titleView;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem.title = @"";
    
    // create date scroller
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];

    // configure scrollview
    _dayScrollView.tag = 1;
    _dayScrollView.pagingEnabled = YES;
    _dayScrollView.contentSize = CGSizeMake(356*[_course.events count], 70);
    
    for (int x=0; x<[_course.events count]; x++) {
        
        // load event
        DUNEvent *event = [_course.events objectAtIndex:x];
        
        // configure back view
        UIView *dayView = [[UIView alloc] initWithFrame:CGRectMake(x*356 + 8, 15, 340, 40)];
        dayView.layer.borderWidth = 1.0;
        dayView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        dayView.layer.cornerRadius = 5.0;
        dayView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [formatter setDateFormat:@"EEE HH"];
        
        NSString *weekdayStartEnd = [formatter stringFromDate:event.startAt];
        [formatter setDateFormat:@"HH"];
        
        // configure schedule
        UILabel *scheduleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 100, 21)];
        scheduleLabel.text = [NSString stringWithFormat:@"%@-%@", weekdayStartEnd, [formatter stringFromDate:event.endAt]];
        scheduleLabel.font = [UIFont latoWithSize:15.0];
        [dayView addSubview:scheduleLabel];
        
        // configure date
        UILabel *orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 8, 80, 21)];
        [formatter setDateFormat:@"dd MMM"];
        orderLabel.text = [formatter stringFromDate:event.startAt];
        orderLabel.font = [UIFont latoBoldWithSize:15.0];
        orderLabel.textAlignment = NSTextAlignmentCenter;
        [dayView addSubview:orderLabel];
        
        // class number
        UILabel *classLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 8, 60, 21)];
        classLabel.text = [NSString stringWithFormat:@"Aula %d", x+1];
        classLabel.font = [UIFont latoWithSize:15.0];
        [dayView addSubview:classLabel];

        //TODO: check event status
        UILabel *statusIconLabel = [[UILabel alloc] initWithFrame:CGRectMake(310, 10, 15, 21)];
        statusIconLabel.textAlignment = NSTextAlignmentRight;
        statusIconLabel.font = [UIFont dunnoWithSize:15.0];
        statusIconLabel.text = @"f";
        [dayView addSubview:statusIconLabel];
        
        [_dayScrollView addSubview:dayView];
    }

    //TODO: cor virá do json
    // configure footer background color
    if (_course.order == 1) {
        _footerView.backgroundColor = [UIColor dunnoSchema1];
    }
    else if (_course.order == 2) {
        _footerView.backgroundColor = [UIColor dunnoSchema2];
    }
    else if (_course.order == 3) {
        _footerView.backgroundColor = [UIColor dunnoSchema3];
    }
    else if (_course.order == 4) {
        _footerView.backgroundColor = [UIColor dunnoSchema4];
    }
    
    // configure title
    _classNameLabel.font = [UIFont latoWithSize:18.0];
    _classNameLabel.text = _course.className;
    
    // configure code button
    _codeLabel.font= [UIFont latoWithSize:18.0];
    _codeLabel.text = [NSString stringWithFormat:@"[ %@ ]", _course.accessCode];
    _codeLabel.userInteractionEnabled = YES;
    [_codeLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCode)]];

    // scroll to selected event
    [_dayScrollView scrollRectToVisible:CGRectMake(356*_eventIndex, 0, 356, 70) animated:YES];
    
    // load event
    [self loadEventData:_eventIndex];
    
    // configure segmented control font
    UIFont *font = [UIFont latoWithSize:15.0];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [_filterView setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    // prevent extra lines
    _activityView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _timelinewView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // configure students button
    UIButton *studentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    studentButton.frame = CGRectMake(0, 0, 40, 20);
    [studentButton setTitle:@"H" forState:UIControlStateNormal];
    studentButton.titleLabel.font = [UIFont dunnoWithSize:21.0];
    studentButton.titleLabel.textColor = [UIColor whiteColor];
    [studentButton addTarget:self action:@selector(showStudentPopover:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:studentButton];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)loadEventData:(NSInteger)index {
    
    [MBProgressHUD showHUDAddedTo:_activityView animated:YES];
    
    // get cached event
    DUNEvent *event = (DUNEvent*)[_course.events objectAtIndex:index];
    
    //TODO: remover depois do envio de "personal_notes" em /teacher/courses
    // load event
    [[DUNAPI sharedInstance] loadTeacherEventWithUuid:event.uuid success:^(DUNEvent *result) {
        _topicList = result.topics;
        _personalNoteList = result.personalNotes;
        [_activityView reloadData];
        _timelineList = result.timeline.messages;
        [_timelinewView reloadData];
        [MBProgressHUD hideHUDForView:_activityView animated:YES];
    } error:^(NSError *error) {
        [MBProgressHUD hideHUDForView:_activityView animated:YES];
        //TODO: handle error
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _activityView) {
        // activity table view
        return 2;
    }
    
    // timeline table view
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _activityView) {
        if (section == 0) {
            // topics
            return [_topicList count] > 0 ? [_topicList count] : 1;
        }
        else {
            // personal notes
            return [_personalNoteList count] > 0 ? [_personalNoteList count] : 1;
        }
    }
    else if (tableView == _timelinewView) {
        return [_timelineList count] > 0 ? [_timelineList count] : 1;
    }
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    // title only for activity view
    if (tableView == _activityView) {
        if (section == 0) {
            return @"DIÁRIO";
        }
        else {
            return @"ANOTAÇÕES";
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    // set header font
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView*)view;
    header.textLabel.font = [UIFont latoWithSize:17.0];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (tableView == _activityView) { // activity view
        
        // load cell
        PDActivityViewCell *viewCell = (PDActivityViewCell*)[tableView dequeueReusableCellWithIdentifier:@"PDActivityCell" forIndexPath:indexPath];
        
        if (indexPath.section == 0) { // topics
            
            if (_topicList.count > 0) {
                // configure topic cell
                DUNTopic *topic = (DUNTopic*)[_topicList objectAtIndex:indexPath.row];
                viewCell.titleLabel.text = topic.Description;
                viewCell.statusIconLabel.text = @"Z";
                viewCell.indicatorIconLabel.text = @"t";
            }
            else {
                // no items
                viewCell.titleLabel.text = @"Nenhum tópico encontrado";
                viewCell.statusIconLabel.text = @"";
                viewCell.indicatorIconLabel.text = @"";
            }
        }
        else {
            if (_personalNoteList.count > 0) {
                // configure note cell
                DUNPersonalNote *note = (DUNPersonalNote*)[_personalNoteList objectAtIndex:indexPath.row];
                viewCell.titleLabel.text = note.content;
                viewCell.statusIconLabel.text = @"f";
                viewCell.indicatorIconLabel.text = @"s";
            }
            else {
                // no items
                viewCell.titleLabel.text = @"Nenhuma anotação encontrada";
                viewCell.statusIconLabel.text = @"";
                viewCell.indicatorIconLabel.text = @"";
            }
        }
        cell = viewCell;
    }
    else if (tableView == _timelinewView) { // timeline
        PDTimelineViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:@"PDTimelineCell" forIndexPath:indexPath];
        if (_timelineList.count > 0) {
            // configure message cell
            DUNMessage *message = (DUNMessage*)[_timelineList objectAtIndex:indexPath.row];
            viewCell.titleLabel.text = message.author.name;
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd/MM/yyyy - HH:mm'h'"];
            viewCell.authorLabel.text = [formatter stringFromDate:message.createdAt];
            viewCell.contentLabel.text = message.content;
            
            // configure image
            [viewCell.avatarView setImageWithURL:[NSURL URLWithString:@"http://lorempixel.com/30/30"]];
            
            // configure votes
            int votes = message.upVotes-message.downVotes;
            
            NSMutableAttributedString *likeText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"v   %d", message.upVotes-message.downVotes]];
            [likeText addAttribute:NSFontAttributeName value:[UIFont dunnoWithSize:17.0] range:NSMakeRange(0, 1)];
            viewCell.likeLabel.attributedText = likeText;
            
            if (votes > 0) {
                viewCell.likeView.backgroundColor = [UIColor greenColor];
            }
            else {
                viewCell.likeView.backgroundColor = [UIColor lightGrayColor];
            }
        }
        else {
            // no items
            viewCell.titleLabel.text = @"Nenhuma mensagem encontrada";
            viewCell.avatarView.image = nil;
            viewCell.authorLabel.text = @"";
            viewCell.contentLabel.text = @"";
        }
        
        cell = viewCell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == _activityView) {
        return 50.0;
    }
    return 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // if tag==1, callback from day scroller
    if (scrollView.tag == 1) {
        // calculate page
        int page = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        //TODO: dados virão da matriz
        // load data
        [self loadEventData:page];
    }
}

//- (void)showStudentsPopover:(id)sender {
//    // configure popover
//    PDActivityMenuViewController *popover = [self.storyboard instantiateViewControllerWithIdentifier:@"PDActivityMenuController"];
//    _activityPopover = [[UIPopoverController alloc] initWithContentViewController:popover];
//    
//    // show
//    [_activityPopover presentPopoverFromRect:CGRectMake(973, 44, 30, 30) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
//}

- (void)showOptionsPopover:(id)sender {
    UIView *view = ((UILongPressGestureRecognizer*)sender).view;
    PDActivityMenuViewController *popover = [self.storyboard instantiateViewControllerWithIdentifier:@"PDActivityMenuController"];
    _activityPopover = [[UIPopoverController alloc] initWithContentViewController:popover];
    [_activityPopover presentPopoverFromRect:view.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if ([_activityPopover isPopoverVisible]) {
        [_activityPopover dismissPopoverAnimated:NO];
    }
    
    NSLog(@"Here");
    CGPoint p = [gestureRecognizer locationInView:_activityView];
    
    NSIndexPath *indexPath = [_activityView indexPathForRowAtPoint:p];
    
    UITableViewCell *cell = [_activityView cellForRowAtIndexPath:indexPath];
    PDActivityMenuViewController *popover = [self.storyboard instantiateViewControllerWithIdentifier:@"PDActivityMenuController"];
    _activityPopover = [[UIPopoverController alloc] initWithContentViewController:popover];

    [_activityPopover presentPopoverFromRect:cell.frame inView:_activityView permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
    if (indexPath == nil) {
        NSLog(@"long press on table view but not on a row");
    }
    else {
        if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            NSLog(@"long press on table view at row %d", indexPath.row);
        }
        else {
            NSLog(@"gestureRecognizer.state = %d", gestureRecognizer.state);
        }
    }
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
        //_studentList = [NSMutableArray arrayWithArray:results];
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
