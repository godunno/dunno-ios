//
//  EventViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DUNCourse.h"

@interface PDEventViewController : UICollectionViewController

@property (nonatomic, strong) DUNCourse *course;
@property (nonatomic, strong) NSMutableArray *eventList;

@end
