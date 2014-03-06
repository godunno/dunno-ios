#import "JSONModel.h"
#import "DUNStudent.h"

@protocol DUNTimelineUserMessage
@end

@interface DUNTimelineUserMessage : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) DUNStudent<Optional> *owner;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSDate *sentAt;

@property (nonatomic, assign) NSNumber<Optional> *upVotes;
@property (nonatomic, assign) NSNumber<Optional> *downVotes;

@property (nonatomic, copy, getter=isAlreadyVoted) NSString<Optional> *alreadyVoted;

- (void) addOneUpVote;
- (void) addOneDownVote;

- (BOOL)alreadyUpVoted;
- (BOOL)alreadyDownVoted;

+ (instancetype) initWithContent:(NSString*)content;

@end
