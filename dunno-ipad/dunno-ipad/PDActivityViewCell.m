//
//  ActivityViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDActivityViewCell.h"
#import "UIFont+Lato.h"
#import "UIFont+Dunno.h"
#import "UIColor+Dunno.h"

@implementation PDActivityViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    _titleLabel.font = [UIFont latoLightWithSize:14.0];
    _statusIconLabel.font = [UIFont dunnoWithSize:20.0];
    _indicatorIconLabel.font = [UIFont dunnoWithSize:14.0];
    _indicatorIconLabel.textColor = UIColorFromRGB(0xd2d2d2);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
