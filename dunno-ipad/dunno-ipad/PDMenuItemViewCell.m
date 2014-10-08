//
//  MenuItemTableViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDMenuItemViewCell.h"
#import "UIFont+Lato.h"
#import "UIFont+Dunno.h"
#import "UIColor+Dunno.h"

@implementation PDMenuItemViewCell

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
    _titleLabel.font = [UIFont latoWithSize:14.0];
    _titleLabel.textColor = [UIColor darkGrayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self setSelectedBackgroundView:view];
    
    if (selected) {
        _iconView.alpha = 1.0;
        _titleLabel.alpha = 1.0;
    }
    else {
        _iconView.alpha = 0.5;
        _titleLabel.alpha = 0.5;
    }
}

@end
