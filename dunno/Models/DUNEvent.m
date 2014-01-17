//
//  DUNEvent.m
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNEvent.h"
#import "DUNSpeaker.h"
#import "DUNLocation.h"
#import "DUNUser.h"
#import "DUNOrganization.h"

#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"
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
  

  DCArrayMapping *speakersMapping = [DCArrayMapping mapperForClassElements:[DUNSpeaker class] forAttribute:@"speakers" onClass:[DUNSpeaker class]];
  DCObjectMapping *speakerIdMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNSpeaker class]];
  DCObjectMapping *speakerPictureMapping = [DCObjectMapping mapKeyPath:@"picture" toAttribute:@"pictureURLString" onClass:[DUNSpeaker class]];
  
  DCObjectMapping *userIdMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNUser class]];
  DCObjectMapping *userPicMapping = [DCObjectMapping mapKeyPath:@"picture" toAttribute:@"pictureURLString" onClass:[DUNUser class]];
  
  DCObjectMapping *organizationIdMapping = [DCObjectMapping mapKeyPath:@"id" toAttribute:@"entityId" onClass:[DUNOrganization class]];
  DCObjectMapping *organizationPicMapping = [DCObjectMapping mapKeyPath:@"picture" toAttribute:@"pictureURLString" onClass:[DUNOrganization class]];
  
  [config addObjectMapping:idMapping];
  [config addObjectMapping:descMapping];
  [config addObjectMapping:picMapping];
  [config addArrayMapper:speakersMapping];
  [config addObjectMapping:speakerIdMapping];
  [config addObjectMapping:speakerPictureMapping];
  [config addObjectMapping:userIdMapping];
  [config addObjectMapping:userPicMapping];
  [config addObjectMapping:organizationIdMapping];
  [config addObjectMapping:organizationPicMapping];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNEvent class] andConfiguration:config];
  
  return [parser parseDictionary:jsonDict];
}

@end
