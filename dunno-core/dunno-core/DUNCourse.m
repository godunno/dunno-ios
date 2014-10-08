//
//  DUNCourse.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "DUNCourse.h"
#import "DUNSchedule.h"
#import "DUNEvent.h"

@implementation DUNCourse

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
        @"uuid": @"uuid",
        @"name": @"name",
        @"startDate": @"start_date",
        @"endDate": @"end_date",
        @"className": @"class_name",
        @"order" : @"order",
        @"accessCode" : @"access_code",
        @"institution": @"institution",
        @"weeklySchedules": @"weekly_schedules",
        @"students": @"students",
        @"teacher": @"teacher",
        @"events": @"events",
    };
}
+ (NSDateFormatter*)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return formatter;
}
+ (NSValueTransformer *)weeklySchedulesJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNSchedule.class];
}
+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNEvent.class];
}
+ (NSValueTransformer *)teacherJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNTeacher.class];
}
+ (NSValueTransformer *)startDateJSONTransformer {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}
+ (NSValueTransformer *)endDateJSONTransformer {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [MTLValueTransformer transformerWithBlock:^id(id str) {
        return [formatter dateFromString:str];
    }];
}
@end
