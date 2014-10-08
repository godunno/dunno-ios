//
//  ClassViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDClassViewCell.h"
#import "UIFont+Lato.h"
#import "UIFont+Dunno.h"
#import "UIColor+Dunno.h"

@implementation PDClassViewCell

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
    _classNameLabel.font = [UIFont latoWithSize:24.0];
    _institutionLabel.font = [UIFont latoWithSize:10.0];
    _dayLabel.font = [UIFont latoWithSize:32.0];
    _dayLabel.textColor = [UIColor blackColor];
    _monthLabel.font = [UIFont latoWithSize:12.0];
    _monthLabel.textColor = [UIColor blackColor];
    
    _nameLabel.font = [UIFont latoWithSize:12.0];
    
    _scheduleLabel.font = [UIFont latoWithSize:12.0];
    _timeIconLabel.font = [UIFont dunnoWithSize:14.0];
    _timeIconLabel.textColor = [UIColor redColor];
    _timeLabel.font = [UIFont latoWithSize:12.0];
    _timeLabel.textColor = [UIColor redColor];
    _statusIconLabel.font = [UIFont dunnoWithSize:14.0];
    _classOrderLabel.font = [UIFont latoWithSize:12.0];
    
    _dateBackgroundView.layer.cornerRadius = 40.0;
    _dateBackgroundView.backgroundColor = [UIColor whiteColor];
    _dateBorderBackgroundView.layer.cornerRadius = 43.0;
    self.layer.cornerRadius = 5.0;
    _topView.backgroundColor = UIColorFromRGB(0xFEDD59);
}

@end
