//
//  EventViewCell.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDEventViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *scheduleLabel;
@property (nonatomic, weak) IBOutlet UILabel *dayLabel;
@property (nonatomic, weak) IBOutlet UILabel *monthLabel;
@property (nonatomic, weak) IBOutlet UILabel *classNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusIconLabel;

@property (nonatomic, weak) IBOutlet UIView *dateBackgroundView;
@end
