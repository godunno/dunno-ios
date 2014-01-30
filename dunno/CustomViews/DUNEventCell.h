//
//  DUNEventCell.h
//  dunno
//
//  Created by fagner feitosa on 1/29/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DUNEventCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomMarginView;

@end
