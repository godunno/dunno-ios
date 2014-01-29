#import "NSObject+DUNJsonParser.h"

@implementation NSObject (DUNJsonParser)

+ (id) instanceFromJsonDictionary:(NSDictionary*)jsonDict
{
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [self defaultParserConfig];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:self andConfiguration:config];
  
  return [parser parseDictionary:jsonDict];
}

+ (DCParserConfiguration*)defaultParserConfig
{
  DCParserConfiguration *config = [DCParserConfiguration configuration];
  config.datePattern = @"dd-MM-yyyy HH:mm";
  
  [self addToConfig:&config mappings:self];
  
  return config;
}

+ (DCParserConfiguration*) addToConfig:(DCParserConfiguration**)config mappings:(Class<DUNJsonParseable>)parseableClass
{
  if (![self conformsToProtocol:@protocol(DUNJsonParseable)])
    return nil;
  
  [[parseableClass mappings] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    
    if([key hasSuffix:@"[]"])
    {
      NSString *attributeName = [key substringToIndex:(((NSString*)key).length-2)];
      
      DCArrayMapping *mapping = [DCArrayMapping mapperForClassElements:obj forAttribute:attributeName onClass:self];
      [*config addArrayMapper:mapping];

      // add attribute mappings
      [self addToConfig:config mappings:obj];
      
    } else {
      DCObjectMapping *mapping = [DCObjectMapping mapKeyPath:key toAttribute:obj onClass:parseableClass];
      [*config addObjectMapping:mapping];
    }
  }];

  return *config;
}



@end
