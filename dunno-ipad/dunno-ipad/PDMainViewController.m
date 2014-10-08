//
//  MainViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDMainViewController.h"
#import "PDMenuViewController.h"
#import "PDClassViewController.h"
#import "PDCourseViewController.h"
#import "PDEventViewController.h"
#import "DUNAPI.h"
#import "PDAppDelegate.h"
#import "PDLoginViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define MENU_CLASS 1
#define MENU_COURSE 2
#define MENU_LOGOUT 9

@interface PDMainViewController ()

@property (nonatomic, strong) PDMenuViewController *menuView;
@property (nonatomic, strong) PDClassViewController *classView;
@property (nonatomic, strong) PDCourseViewController *courseView;
@property (nonatomic, strong) UIViewController *rightView;

@property (nonatomic, strong) UINavigationController *navClass;
@property (nonatomic, strong) UINavigationController *navCourse;

@end

@interface PDMainViewController()

@property (nonatomic, assign) BOOL firstShow;

@end

@implementation PDMainViewController

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

    // configure menu view
    _menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"PDMenuController"];
    _menuView.view.translatesAutoresizingMaskIntoConstraints = NO;
    _menuView.delegate = self;
    [self.view addSubview:_menuView.view];

    // configure right view (main content)
    _rightView = [[UIViewController alloc] init];
    _rightView.view.translatesAutoresizingMaskIntoConstraints = NO;
    _rightView.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_rightView.view];
    
    // add constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view(120)]" options:0 metrics:nil views:@{@"view": _menuView.view}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": _menuView.view}]];

    // configure course
    _courseView = [self.storyboard instantiateViewControllerWithIdentifier:@"PDCourseController"];
    _courseView.delegate = self;
    
    // embed in navigation controller
    _navCourse = [[UINavigationController alloc] initWithRootViewController:_courseView];
    _navCourse.navigationBar.topItem.title = @"Disciplinas";
    
    // add to parent
    [_rightView.view addSubview: _navCourse.view];
    [_rightView addChildViewController:_navCourse];
    [_rightView didMoveToParentViewController:_navCourse];

    // add constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:@{@"view": _navCourse.view}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": _navCourse.view}]];
    
    // configure class
    _classView = [self.storyboard instantiateViewControllerWithIdentifier:@"PDClassController"];
    
    // embed in navigation controller
    _navClass = [[UINavigationController alloc] initWithRootViewController:_classView];
    _navClass.navigationBar.topItem.title = @"Aulas";
    
    // add to parent
    [_rightView.view addSubview:_navClass.view];
    [_rightView addChildViewController:_navClass];
    [_rightView didMoveToParentViewController:_navClass];

    // add constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:@{@"view": _navClass.view}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": _navClass.view}]];

    // add main layout constraints
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[left][right]|" options:0 metrics:nil views:@{@"left": _menuView.view, @"right": _rightView.view}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": _rightView.view}]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    // hide navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
    
    // load app delegate
    PDAppDelegate *app = (PDAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if (app.currentUser == nil) { // not logged
        
        // flag to select menu item after login
        _firstShow = YES;
        
        // show login
        PDLoginViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PDLoginViewController"];
        [self presentViewController:viewController animated:NO completion:nil];
    }
    else {
        if (_firstShow) {
            // select item
            _firstShow = NO;
            [_menuView selectItem:0];
            [self didSelectItem:MENU_CLASS];
        }
    }
    
}
- (void)viewWillDisappear:(BOOL)animated {
    // show navigation bar
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didSelectItem:(NSInteger)rowIndex {
    
    if (rowIndex == MENU_CLASS) {
        // show class view
        [_rightView.view bringSubviewToFront:_navClass.view];
        
        [MBProgressHUD showHUDAddedTo:_navClass.view animated:YES];
        
        // load classes
        [[DUNAPI sharedInstance] loadTeacherEventsWithSuccess:^(NSMutableArray *results) {
            [_classView reloadWithData:results];
            [MBProgressHUD hideHUDForView:_navClass.view animated:YES];
        } error:^(NSError *error) {
            [MBProgressHUD hideHUDForView:_navClass.view animated:YES];
            //TODO: handle error
        }];
    }
    else if (rowIndex == MENU_COURSE) {
        // show course view
        [_rightView.view bringSubviewToFront:_navCourse.view];
        
        [MBProgressHUD showHUDAddedTo:_navCourse.view animated:YES];

        // load courses
        [[DUNAPI sharedInstance] loadTeacherCoursesWithSuccess:^(NSMutableArray *results) {
            [_courseView reloadWithData:results];
            [MBProgressHUD hideHUDForView:_navCourse.view animated:YES];
        } error:^(NSError *error) {
            [MBProgressHUD hideHUDForView:_navCourse.view animated:YES];
            //TODO: handle error
        }];

    }
    else if (rowIndex == MENU_LOGOUT) {
        // do logout
        [self logout];
    }
}

- (void)logout {
    // load app delegate
    PDAppDelegate *app = (PDAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    // logout
    [[DUNAPI sharedInstance] logoutUserWithToken:app.currentUser.authenticationToken success:^{
        // clear session
        app.currentUser = nil;
        [_courseView clearData];
        [_classView clearData];
        
        _firstShow = YES;
        
        // show login
        PDLoginViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PDLoginViewController"];
        [self presentViewController:viewController animated:YES completion:nil];
        
    } error:^(NSError *error) {
        //TODO: handle error
    }];
}

- (void)didSelectCourse:(DUNCourse *)course {
    
    // prepare view controller
    PDEventViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PDEventController"];
    
    // load course
    [[DUNAPI sharedInstance] loadTeacherCourseWithUuid:course.uuid success:^(DUNCourse *result) {
        // configure view controller
        self.title = @"Disciplinas";
        viewController.navigationItem.title = result.name;
        viewController.course = result;
        
        // show
        [self.navigationController pushViewController:viewController animated:YES];
    } error:^(NSError *error) {
        //TODO: handle error
    }];    
}

@end
