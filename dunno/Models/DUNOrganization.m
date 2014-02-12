#import "DUNOrganization.h"

#import "NSObject+DUNJsonParser.h"

@implementation DUNOrganization

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

@end
