//
//  DUNEvent.m
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNEvent.h"

#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCArrayMapping.h"

@implementation DUNEvent

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [DCParserConfiguration configuration];
  config.datePattern = @"dd-MM-yyyy HH:mm";

  DCObjectMapping *idMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNEvent class]];
  DCObjectMapping *descMapping = [DCObjectMapping mapKeyPath:@"description" toAttribute:@"shortDescription" onClass:[DUNEvent class]];
  DCObjectMapping *picMapping = [DCObjectMapping mapKeyPath:@"picture" toAttribute:@"pictureURLString" onClass:[DUNEvent class]];
  

  [config addObjectMapping:idMapping];
  [config addObjectMapping:descMapping];
  [config addObjectMapping:picMapping];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNEvent class] andConfiguration:config];
  
  DUNEvent *event = [parser parseDictionary:jsonDict];
  
//  @property (nonatomic, strong) NSArray *speakers;
//  @property (nonatomic, strong) DUNUser *owner;
//  @property (nonatomic, strong) DUNOrganization *organization;

  return event;
}

@end
