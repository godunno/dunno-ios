#import "DUNTimelineInteraction.h"
#import "DUNTeacher.h"


@interface DUNTimelineUserMessage : DUNTimelineInteraction

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) DUNTeacher *owner;
@property (nonatomic, copy) NSString *profilePicture;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger upVoteCount;
@property (nonatomic, assign) NSInteger downVoteCount;

- (void) addOneUpVote;
- (void) addOneDownVote;

@end
