//
//  DUNSpeaker.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNSpeaker.h"

#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"

@implementation DUNSpeaker

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [DCParserConfiguration configuration];
  
  DCObjectMapping *idMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNSpeaker class]];
  DCObjectMapping *picMapping = [DCObjectMapping mapKeyPath:@"picture" toAttribute:@"pictureURLString" onClass:[DUNSpeaker class]];
  
  [config addObjectMapping:idMapping];
  [config addObjectMapping:picMapping];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNSpeaker class] andConfiguration:config];
  
  return [parser parseDictionary:jsonDict];
}

@end
