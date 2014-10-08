//
//  PDStudentTableViewCell.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "PDStudentMenuViewCell.h"
#import "UIFont+Lato.h"

@implementation PDStudentMenuViewCell

- (void)awakeFromNib {
    // Initialization code
    _pictureView.layer.cornerRadius = 24.0;
    _pictureView.layer.masksToBounds = YES;
    _pictureView.clipsToBounds = YES;
    
    _nameLabel.font = [UIFont latoWithSize:17.0];
    _ageLabel.font = [UIFont latoWithSize:14.0];
    _ageLabel.textColor = [UIColor lightGrayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
