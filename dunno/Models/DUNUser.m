#import "DUNUser.h"

@implementation DUNUser


+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"entityId",@"avatar" : @"avatarURLString",}];
}

@end
