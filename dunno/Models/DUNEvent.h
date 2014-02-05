#import "NSObject+DUNJsonParser.h"

#import "DUNLocation.h"
#import "DUNSpeaker.h"
#import "DUNUser.h"
#import "DUNOrganization.h"
#import "DUNTimeline.h"

typedef NS_ENUM(NSInteger, DUNEventStatus)
{
  DUNEventAvailable,
  DUNEventScheduled,
  DUNEventOpened,
  DUNEventClosed,
};

@interface DUNEvent : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *shortDescription;
@property (nonatomic, strong) DUNLocation *location;
@property (nonatomic, strong) NSDate *startAt;
@property (nonatomic, strong) NSDate *finishAt;
@property (nonatomic, copy) NSString *pictureURLString;
@property (nonatomic) DUNEventStatus status;

@property (nonatomic, strong) NSArray *speakers;

@property (nonatomic, strong) DUNUser *owner;
@property (nonatomic, strong) DUNOrganization *organization;

@property (nonatomic, strong) DUNTimeline *timeline;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end