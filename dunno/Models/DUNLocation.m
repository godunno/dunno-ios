#import "DUNLocation.h"

@implementation DUNLocation

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"id" : @"entityId"};
}


@end
