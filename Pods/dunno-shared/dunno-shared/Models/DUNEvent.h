#import "JSONModel.h"

@class DUNCourse;
@class DUNTimeline;

@protocol DUNThermometer;
@protocol DUNTopic;
@protocol DUNPoll;

@protocol DUNEvent
@end

@interface DUNEvent : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString<Optional> *status;
@property (nonatomic, assign) NSNumber<Optional> *duration;
@property (nonatomic, strong) NSDate *startAt;

@property (nonatomic, strong) DUNTimeline<Optional> *timeline;
@property (nonatomic, strong) DUNCourse *course;
@property (nonatomic, strong) NSArray<DUNTopic, Optional> *topics;
@property (nonatomic, strong) NSArray<DUNThermometer, Optional> *thermometers;
@property (nonatomic, strong) NSArray<DUNPoll, Optional> *polls;

//pusher properties
@property (nonatomic, copy) NSString<Optional> *channelName;
@property (nonatomic, copy) NSString<Optional> *studentMessageEvent;
@property (nonatomic, copy) NSString<Optional> *upDownVoteMessageEvent;
@property (nonatomic, copy) NSString<Optional> *closeEvent;
@property (nonatomic, copy) NSString<Optional> *releasePollEvent;


- (BOOL) isOpen;
- (BOOL) isClosed;

@end
