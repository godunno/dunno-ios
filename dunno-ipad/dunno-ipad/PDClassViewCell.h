//
//  ClassViewCell.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDClassViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *classNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *institutionLabel;
@property (nonatomic, weak) IBOutlet UILabel *dayLabel;
@property (nonatomic, weak) IBOutlet UILabel *monthLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *scheduleLabel;
@property (nonatomic, weak) IBOutlet UILabel *classOrderLabel;

@property (nonatomic, weak) IBOutlet UILabel *timeIconLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusIconLabel;

@property (nonatomic, weak) IBOutlet UIView *topView;
@property (nonatomic, weak) IBOutlet UIView *dateBackgroundView;
@property (nonatomic, weak) IBOutlet UIView *dateBorderBackgroundView;

@end
