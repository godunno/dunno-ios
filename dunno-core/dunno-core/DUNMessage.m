//
//  DUNMessage.m
//  dunno-core
//
//  Created by Wanderley Miyata on 9/28/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "DUNMessage.h"
#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

@implementation DUNMessage

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"uuid": @"uuid",
             @"content": @"content",
             @"createdAt": @"created_at",
             @"author": @"author",
             @"upVotes": @"up_votes",
             @"downVotes": @"down_votes",
             };
}

+ (NSValueTransformer*)createdAtJSONTransformer {
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}

+ (NSValueTransformer *)authorJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNStudent.class];
}
@end
