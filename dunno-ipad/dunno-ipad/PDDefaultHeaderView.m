//
//  DefaultHeaderView.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDDefaultHeaderView.h"
#import "UIFont+Lato.h"
#import "UIColor+Dunno.h"

@implementation PDDefaultHeaderView

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
    _titleLabel.font = [UIFont latoWithSize:24.0];
    self.backgroundColor = UIColorFromRGB(0x2B3738);
}

@end
