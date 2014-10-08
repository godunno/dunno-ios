//
//  PDStudentTableViewCell.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDStudentMenuViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *pictureView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *ageLabel;

@end
