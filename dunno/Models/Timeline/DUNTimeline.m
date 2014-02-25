#import "DUNTimeline.h"

@implementation DUNTimeline


+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:
          @{
            @"id": @"entityId",
            }
          ];
}

@end
