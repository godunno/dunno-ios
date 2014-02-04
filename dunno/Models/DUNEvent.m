#import "DUNEvent.h"

@implementation DUNEvent

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [self defaultParserConfig];
  
  [self addToConfig:&config mappings:[DUNLocation class]];
  [self addToConfig:&config mappings:[DUNUser class]];
  [self addToConfig:&config mappings:[DUNOrganization class]];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNEvent class] andConfiguration:config];
  
  return [parser parseDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"id" : @"entityId",
           @"description" : @"shortDescription",
           @"picture" : @"pictureURLString",
           @"speakers[]" : [DUNSpeaker class],
           };
}


@end
