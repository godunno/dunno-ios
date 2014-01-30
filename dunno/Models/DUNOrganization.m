#import "DUNOrganization.h"

#import "NSObject+DUNJsonParser.h"

@implementation DUNOrganization

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"id" : @"entityId",
           @"picture" : @"pictureURLString",};
}

@end
