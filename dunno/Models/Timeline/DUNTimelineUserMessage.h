#import "DUNTimelineInteraction.h"
#import "DUNUser.h"


@interface DUNTimelineUserMessage : DUNTimelineInteraction

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) DUNUser *owner;
@property (nonatomic, copy) NSString *profilePicture;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger upVoteCount;
@property (nonatomic, assign) NSInteger downVoteCount;

- (void) addOneUpVote;
- (void) addOneDownVote;

@end
