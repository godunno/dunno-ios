#import "DUNEvent.h"

@implementation DUNEvent


- (BOOL) isOpen
{
  return (_status == DUNEventOpened);
}

- (BOOL) isClosed
{
  return (_status == DUNEventClosed);
}

@end
