#import "DUNSpeaker.h"

@implementation DUNSpeaker

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"uid" : @"entityId",
           @"picture" : @"pictureURLString",};
}

@end
