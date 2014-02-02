#import "DUNTimeline.h"

@implementation DUNTimeline

- (id)init
{
  self = [super init];
  if (self) {
    _interactions = [NSMutableArray array];
  }
  return self;
}

- (void) addInteraction:(DUNTimelineInteraction*)interaction
{
  NSParameterAssert(interaction!=nil);
  
  [_interactions addObject:interaction];
}

@end
