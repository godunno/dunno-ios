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
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [DCParserConfiguration configuration];
  
  DCObjectMapping *idMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNUser class]];
  DCObjectMapping *picMapping = [DCObjectMapping mapKeyPath:@"picture" toAttribute:@"pictureURLString" onClass:[DUNUser class]];
  
  [config addObjectMapping:idMapping];
  [config addObjectMapping:picMapping];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNUser class] andConfiguration:config];
  
  return [parser parseDictionary:jsonDict];
}






@end
