//
//  ClassViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDClassViewController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray *eventList;

- (void)reloadWithData:(NSMutableArray *)data;
- (void)clearData;

@end
