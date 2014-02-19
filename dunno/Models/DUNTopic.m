#import "DUNTopic.h"

@implementation DUNTopic

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"entityId", @"description" : @"title"}];
}


@end
