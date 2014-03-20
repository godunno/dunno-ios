#import "DUNCourse.h"

@implementation DUNCourse

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{
              @"id": @"entityId",
              @"created_at": @"createdAt",
         }];
}

@end
