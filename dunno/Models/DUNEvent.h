#import "JSONModel.h"
#import "DUNTeacher.h"
#import "DUNOrganization.h"
#import "DUNTimeline.h"

@protocol DUNEvent
@end

@interface DUNEvent : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) DUNTeacher *teacher;

@property (nonatomic, strong) DUNTimeline *timeline;

- (BOOL) isOpen;
- (BOOL) isClosed;

@end