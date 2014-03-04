#import "JSONModel.h"
#import "DUNTeacher.h"
#import "DUNTimeline.h"
#import "DUNTopic.h"

@protocol DUNEvent
@end

@interface DUNEvent : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;

//@property (nonatomic, copy) NSString<Optional> *duration;
@property (nonatomic, strong) NSDate *startAt;

@property (nonatomic, strong) DUNTeacher *teacher;
@property (nonatomic, strong) DUNTimeline *timeline;

@property (nonatomic, strong) NSArray<DUNTopic> *topics;

//pusher properties
@property (nonatomic, copy) NSString<Optional> *channelName;
@property (nonatomic, copy) NSString<Optional> *studentMessageEvent;
@property (nonatomic, copy) NSString<Optional> *upDownVoteMessageEvent;
@property (nonatomic, copy) NSString<Optional> *receivePollEvent;
@property (nonatomic, copy) NSString<Optional> *receiveRatingEvent;

- (BOOL) isOpen;
- (BOOL) isClosed;

@end
