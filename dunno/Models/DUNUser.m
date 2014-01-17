//
//  DUNUser.m
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNUser.h"

#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"

@implementation DUNUser

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"id" : @"entityId",
           @"picture" : @"pictureURLString",};
}

@end
