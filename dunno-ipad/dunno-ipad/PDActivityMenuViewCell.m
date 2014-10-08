//
//  ActivityMenuViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/2/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDActivityMenuViewCell.h"
#import "UIFont+Lato.h"
#import "UIColor+Dunno.h"

@implementation PDActivityMenuViewCell

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
    self.textLabel.font = [UIFont latoWithSize:17.0];
    self.textLabel.textColor = UIColorFromRGB(0x1CC678);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
