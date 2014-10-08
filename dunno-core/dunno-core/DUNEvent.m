//
//  DUNEvent.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "DUNEvent.h"
#import "DUNCourse.h"
#import "DUNTopic.h"
#import "DUNPersonalNote.h"
#import "DUNTimeline.h"
#import "ISO8601DateFormatter/ISO8601DateFormatter.h"

@implementation DUNEvent

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"eventId": @"id",
        @"uuid": @"uuid",
        @"channel": @"channel",
        @"status": @"status",
        @"order": @"order",
        @"startAt": @"start_at",
        @"endAt" : @"end_at",
        @"studentMessageEvent" : @"student_message_event",
        @"upDownVoteMessageEvent": @"up_down_vote_message_event",
        @"course": @"course",
        @"topics": @"topics",
        @"personalNotes": @"personal_notes",
        @"timeline": @"timeline",
    };
}

+ (NSValueTransformer*)startAtJSONTransformer {
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}
+ (NSValueTransformer*)endAtJSONTransformer {
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}
+ (NSValueTransformer *)courseJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNCourse.class];
}

+ (NSValueTransformer *)topicsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNTopic.class];
}

+ (NSValueTransformer *)personalNotesJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNPersonalNote.class];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNTimeline.class];
}

@end
