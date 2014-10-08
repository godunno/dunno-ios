//
//  DUNCourse.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "DUNTeacher.h"

@interface DUNCourse : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSDate *startDate;
@property (nonatomic, readonly, copy) NSDate *endDate;
@property (nonatomic, readonly, copy) NSString *className;
@property (nonatomic, readonly, assign) NSInteger order;
@property (nonatomic, readonly, copy) NSString *accessCode;
@property (nonatomic, readonly, copy) NSString *institution;

@property (nonatomic, readonly, copy) NSMutableArray *weeklySchedules;
@property (nonatomic, readonly, copy) NSMutableArray *students;
@property (nonatomic, readonly, copy) NSMutableArray *events;

@property (nonatomic, readonly, copy) DUNTeacher *teacher;

@end
