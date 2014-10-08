//
//  SingleEventViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DUNEvent.h"
#import "DUNCourse.h"

@interface PDSingleEventViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *backgroundView;
@property (nonatomic, weak) IBOutlet UIScrollView *dayScrollView;
@property (nonatomic, weak) IBOutlet UITableView *activityView;
@property (nonatomic, weak) IBOutlet UITableView *timelinewView;
@property (nonatomic, weak) IBOutlet UISegmentedControl *filterView;

@property (nonatomic, weak) IBOutlet UIView *footerView;
@property (nonatomic, weak) IBOutlet UILabel *classNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *codeLabel;

@property (nonatomic, strong) DUNCourse *course;
@property (nonatomic, strong) DUNEvent *event;
@property (nonatomic, assign) NSInteger eventIndex;

@end
