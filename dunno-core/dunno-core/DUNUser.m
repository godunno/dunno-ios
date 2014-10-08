//
//  DUNTeacher.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "DUNUser.h"

@implementation DUNUser

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"authenticationToken": @"authentication_token",
        @"email": @"email",
        @"userId": @"id",
        @"name": @"name",
    };
}

@end
