#import "DUNTimeline.h"

@implementation DUNTimeline

- (void) updateMessage:(DUNTimelineUserMessage*)message
{
  NSParameterAssert(message!=nil);
  NSParameterAssert(message.entityId!=nil);
  
  [_messages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    DUNTimelineUserMessage* m = (DUNTimelineUserMessage*)obj;
    if([message.entityId isEqualToString:m.entityId]){
      [_messages replaceObjectAtIndex:idx withObject:message];
      *stop = TRUE;
    }
  }];
}

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:
          @{
            @"id": @"entityId",
            }
          ];
}

@end
