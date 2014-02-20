#import "DUNStudent.h"

@implementation DUNStudent


+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:
          @{@"id": @"entityId",
            @"avatar" : @"avatarURLString"
            }
          ];
}

@end
