//
//  EventViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDEventViewCell.h"
#import "UIFont+Dunno.h"
#import "UIFont+Lato.h"

@implementation PDEventViewCell

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
    
    _dayLabel.font = [UIFont latoWithSize:28.0];
    _monthLabel.font = [UIFont latoWithSize:11.0];
    _scheduleLabel.font = [UIFont latoWithSize:12.0];
    _classNumberLabel.font = [UIFont latoWithSize:12.0];
    _statusIconLabel.font = [UIFont dunnoWithSize:12.0];
    
    self.layer.cornerRadius = 5.0;
}

@end
