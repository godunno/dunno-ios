//
//  CourseViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDCourseViewCell.h"
#import "UIFont+Lato.h"
#import "UIFont+Dunno.h"
#import "UIColor+Dunno.h"

@interface PDCourseViewCell()

@property (nonatomic, assign) BOOL scheduleVisible;

@end

@implementation PDCourseViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)awakeFromNib {
    
    _nameLabel.font = [UIFont latoWithSize:18.0];
    _classNameLabel.font = [UIFont latoWithSize:14.0];
    _locationLabel.font = [UIFont latoWithSize:14.0];
    
    _calendarIconLabel.font = [UIFont dunnoWithSize:14.0];
    _calendarIconLabel.userInteractionEnabled = YES;
    [_calendarIconLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleSchedule)]];
    
    _periodLabel.font = [UIFont latoWithSize:14.0];
    _periodLabel.userInteractionEnabled = YES;
    [_periodLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleSchedule)]];
    
    _studentIconLabel.font = [UIFont dunnoWithSize:14.0];
    _studentCountLabel.font = [UIFont latoWithSize:14.0];
    
    self.layer.cornerRadius = 5.0;
    _topView.backgroundColor = UIColorFromRGB(0xFEDD59);
    
    CGRect cellFrame = self.frame;
    //cellFrame.origin.x += (cellFrame.size.width - 375);
    cellFrame.origin.x = cellFrame.size.width;
    
    // prepare schedule view
    _scheduleView = [[UIView alloc] initWithFrame:cellFrame];
    _scheduleView.backgroundColor = [UIColor whiteColor];
    _scheduleView.layer.cornerRadius = 5.0;
    _scheduleView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _scheduleView.layer.borderWidth = 1.0;
    
    NSArray *weekdays = @[@"SEG", @"TER", @"QUA", @"QUI", @"SEX", @"SAB", @"DOM"];
    
    _weekdayList = [[NSMutableArray alloc] init];
    _timeList = [[NSMutableArray alloc] init];
    
    int rowGap = 5;
    int dayHeight = (cellFrame.size.height - (8.0*rowGap))/7.0;
    int dayWidth = 50;
    for (int y=0; y<[weekdays count]; y++) {
        UIView *dayView = [[UIView alloc] initWithFrame:CGRectMake(10, (y*(dayHeight+rowGap)) + rowGap, dayWidth, dayHeight)];
        dayView.layer.cornerRadius = 3.0f;
        dayView.layer.borderWidth = 1.0f;
        dayView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, dayWidth-4, dayHeight-4)];
        dayLabel.font = [UIFont latoLightWithSize:13.0];
        dayLabel.text = [weekdays objectAtIndex:y];
        dayLabel.textAlignment = NSTextAlignmentCenter;
        [dayView addSubview:dayLabel];
        
        [_scheduleView addSubview:dayView];
        [_weekdayList addObject:dayView];
        
        int timeX = dayView.frame.origin.x + dayView.frame.size.width + 5;
        UIView *timeView = [[UIView alloc] initWithFrame:CGRectMake(timeX, dayView.frame.origin.y, cellFrame.size.width - timeX - 60, dayHeight + 5)];
        UIView *timeLineView = [[UIView alloc] initWithFrame:CGRectMake(0, dayHeight-1, timeView.frame.size.width, 1)];
        timeLineView.backgroundColor = [UIColor lightGrayColor];
        [timeView addSubview:timeLineView];
        [_scheduleView addSubview:timeView];
        [_timeList addObject:timeView];
    }
    
    [self addSubview:_scheduleView];
}

- (void)toggleSchedule {
    
    if (_scheduleVisible) {
        //hide
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _scheduleView.frame;
            frame.origin.x += 375;
            _scheduleView.frame = frame;
        }];
    }
    else {
        //show
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _scheduleView.frame;
            frame.origin.x -= 375;
            _scheduleView.frame = frame;
        }];
    }
    _scheduleVisible = !_scheduleVisible;
}

@end
