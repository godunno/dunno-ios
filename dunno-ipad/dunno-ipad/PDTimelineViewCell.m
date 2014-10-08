//
//  TimelineViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDTimelineViewCell.h"
#import "UIFont+Lato.h"
#import "UIFont+Dunno.h"
#import "UIColor+Dunno.h"

@implementation PDTimelineViewCell

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
    _titleLabel.font = [UIFont latoBoldWithSize:16.0];
    _authorLabel.font = [UIFont latoLightWithSize:14.0];
    _contentLabel.font = [UIFont latoLightWithSize:14.0];
    _avatarView.layer.cornerRadius = 15.0;
    _avatarView.layer.masksToBounds = YES;
    _likeLabel.font = [UIFont latoWithSize:17.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
