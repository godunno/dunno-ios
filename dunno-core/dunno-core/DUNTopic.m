//
//  DUNTopic.m
//  dunno-core
//
//  Created by Wanderley Miyata on 9/8/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "DUNTopic.h"

@implementation DUNTopic

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"Description": @"description",
        @"order": @"order",
        @"uuid": @"uuid",
    };
}

@end
