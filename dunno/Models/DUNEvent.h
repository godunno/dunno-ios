#import "NSObject+DUNJsonParser.h"

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

@interface DUNEvent : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSDate *startAt;
@property (nonatomic) DUNEventStatus status;

@property (nonatomic, strong) DUNTeacher *teacher;
@property (nonatomic, strong) DUNOrganization *organization;

@property (nonatomic, strong) DUNTimeline *timeline;

+ (instancetype)instanceFromJsonDictionary:(NSDictionary*)jsonDict;

- (BOOL) isOpen;
- (BOOL) isClosed;

@end