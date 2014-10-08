//
//  DUNStudent.m
//  dunno-core
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "DUNStudent.h"

@implementation DUNStudent

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
         @"uuid": @"uuid",
         @"name": @"name",
         @"email": @"email",
         @"avatar": @"avatar",
         };
}

@end
