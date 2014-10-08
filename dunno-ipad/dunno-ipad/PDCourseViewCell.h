//
//  CourseViewCell.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDCourseViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *classNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;

@property (nonatomic, weak) IBOutlet UILabel *calendarIconLabel;
@property (nonatomic, weak) IBOutlet UILabel *periodLabel;
@property (nonatomic, weak) IBOutlet UILabel *studentIconLabel;
@property (nonatomic, weak) IBOutlet UILabel *studentCountLabel;

@property (nonatomic, weak) IBOutlet UIView *topView;
@property (nonatomic, weak) IBOutlet UIView *lineview;
@property (nonatomic, strong) UIView *scheduleView;

@property (nonatomic, strong) NSMutableArray *weekdayList;
@property (nonatomic, strong) NSMutableArray *timeList;

@end
