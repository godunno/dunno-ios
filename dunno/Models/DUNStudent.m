#import "DUNStudent.h"

@implementation DUNStudent


+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:
          @{@"id": @"entityId",
            @"avatar" : @"avatarURLString",
            @"authentication_token" : @"authToken",
            }
          ];
}

@end
