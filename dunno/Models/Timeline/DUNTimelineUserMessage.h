#import "JSONModel.h"
#import "DUNStudent.h"

@protocol DUNTimelineUserMessage
@end

@interface DUNTimelineUserMessage : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) DUNStudent<Optional> *owner;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSDate<Optional> *sentAt;

@property (nonatomic, assign) NSNumber<Optional> *upVotes;
@property (nonatomic, assign) NSNumber<Optional> *downVotes;

- (void) addOneUpVote;
- (void) addOneDownVote;

+ (instancetype) initWithContent:(NSString*)content;

@end
