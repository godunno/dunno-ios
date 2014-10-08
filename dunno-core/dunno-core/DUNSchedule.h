//
//  DUNSchedule.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DUNSchedule : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, assign) NSInteger weekday;
@property (nonatomic, readonly, copy) NSString *startTime;
@property (nonatomic, readonly, copy) NSString *endTime;
@property (nonatomic, readonly, copy) NSString *classroom;

@end
