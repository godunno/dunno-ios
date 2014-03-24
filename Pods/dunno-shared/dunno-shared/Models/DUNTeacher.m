#import "DUNTeacher.h"

@implementation DUNTeacher


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
