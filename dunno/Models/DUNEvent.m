#import "JSONValueTransformer+NSDate.h"
#import "DUNEvent.h"

@implementation DUNEvent


- (BOOL) isOpen
{
  return true;
}

- (BOOL) isClosed
{
  return false;
}


+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{@"start_at": @"startAt"}];
}

@end
