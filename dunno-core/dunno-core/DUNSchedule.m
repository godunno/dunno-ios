//
//  DUNSchedule.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "DUNSchedule.h"

@implementation DUNSchedule

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"weekday": @"weekday",
             @"startTime": @"start_time",
             @"endTime": @"end_time",
             @"classroom": @"classroom",
             };
}

@end
