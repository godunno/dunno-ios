#import "DUNEvent.h"

@implementation DUNEvent

+ (instancetype)instanceFromJsonDictionary:(NSDictionary*)jsonDict
{
  if (jsonDict == nil || [jsonDict isKindOfClass:[NSNull class]])
    return nil;
  
  DCParserConfiguration *config = [self defaultParserConfig];
  
  [self addToConfig:&config mappings:[DUNTeacher class]];
  [self addToConfig:&config mappings:[DUNOrganization class]];
  
  DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[DUNEvent class] andConfiguration:config];
  
  DUNEvent *event = [parser parseDictionary:jsonDict];
  
  return event;
}

- (BOOL) isOpen
{
  return (_status == DUNEventOpened);
}

- (BOOL) isClosed
{
  return (_status == DUNEventClosed);
}

@end
