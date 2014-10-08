//
//  CourseViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DUNCourse.h"

@class PDCourseViewController;

@protocol  PDCourseViewControllerDelegate
- (void)didSelectCourse:(DUNCourse*)course;
@end

@interface PDCourseViewController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray *courseList;

@property (nonatomic, assign) id <PDCourseViewControllerDelegate> delegate;

- (void)reloadWithData:(NSMutableArray *)data;
- (void)clearData;

@end
