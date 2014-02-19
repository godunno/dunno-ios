#import "DUNTimelineInteraction.h"
#import "DUNStudent.h"


@interface DUNTimelineUserMessage : DUNTimelineInteraction

@property (nonatomic, copy) NSString *entityId;

@property (nonatomic, strong) DUNStudent *owner;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSDate<Optional> *sentAt;

@property (nonatomic, assign) NSInteger upVoteCount;
@property (nonatomic, assign) NSInteger downVoteCount;

- (void) addOneUpVote;
- (void) addOneDownVote;

+ (instancetype) initWithContent:(NSString*)content;

@end
