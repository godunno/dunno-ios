#import "JSONModel.h"
#import "DUNTeacher.h"
#import "DUNTimeline.h"
#import "DUNTopic.h"

@protocol DUNEvent
@end

@interface DUNEvent : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSDate *startAt;

@property (nonatomic, strong) DUNTeacher *teacher;
@property (nonatomic, strong) DUNTimeline *timeline;

@property (nonatomic, strong) NSArray<DUNTopic> *topics;

- (BOOL) isOpen;
- (BOOL) isClosed;

@end
