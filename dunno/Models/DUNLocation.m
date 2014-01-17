//
//  DUNLocation.m
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNLocation.h"

#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"

@implementation DUNLocation

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [DCParserConfiguration configuration];

  DCObjectMapping *idMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNLocation class]];

  [config addObjectMapping:idMapping];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNLocation class] andConfiguration:config];
  
  return [parser parseDictionary:jsonDict];
}

@end
