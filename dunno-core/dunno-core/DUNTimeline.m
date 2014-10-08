//
//  DUNTimeline.m
//  dunno-core
//
//  Created by Wanderley Miyata on 9/19/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "DUNTimeline.h"
#import "DUNMessage.h"
#import "ISO8601DateFormatter/ISO8601DateFormatter.h"

@implementation DUNTimeline

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"startAt": @"start_at",
             @"updatedAt": @"updated_at",
             @"messages": @"messages",
             };
}

+ (NSValueTransformer*)startAtJSONTransformer {
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}
+ (NSValueTransformer*)updatedAtJSONTransformer {
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNMessage.class];
}

@end