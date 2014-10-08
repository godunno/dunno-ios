//
//  DUNPersonalNote.m
//  dunno-core
//
//  Created by Wanderley Miyata on 9/18/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "DUNPersonalNote.h"

@implementation DUNPersonalNote

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"uuid": @"uuid",
             @"content": @"content",
             @"order": @"order",
             };
}

@end