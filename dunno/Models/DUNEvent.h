#import "JSONModel.h"
#import "DUNTeacher.h"
#import "DUNOrganization.h"
#import "DUNTimeline.h"

typedef NS_ENUM(NSInteger, DUNEventStatus)
{
  DUNEventDraft,
  DUNEventAvailable,
  DUNEventOpened,
  DUNEventClosed,
};

@protocol DUNEvent
@end

@interface DUNEvent : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSDate *startAt;
@property (nonatomic) DUNEventStatus status;

@property (nonatomic, strong) DUNTeacher *teacher;

@property (nonatomic, strong) DUNTimeline *timeline;

- (BOOL) isOpen;
- (BOOL) isClosed;

@end