//
//  MenuViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDMenuViewController;

@protocol PDMenuViewDelegate
- (void)didSelectItem:(NSInteger)rowIndex;
@end

@interface PDMenuViewController : UITableViewController

@property (nonatomic, assign) id <PDMenuViewDelegate> delegate;

- (void)selectItem:(NSInteger)row;

@end
