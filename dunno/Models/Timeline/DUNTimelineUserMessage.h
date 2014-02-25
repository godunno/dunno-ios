#import "JSONModel.h"
#import "DUNStudent.h"

@protocol DUNTimelineUserMessage
@end

@interface DUNTimelineUserMessage : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) DUNStudent *owner;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSDate<Optional> *sentAt;

@property (nonatomic, assign) NSInteger upVotes;
@property (nonatomic, assign) NSInteger downVotes;

- (void) addOneUpVote;
- (void) addOneDownVote;

+ (instancetype) initWithContent:(NSString*)content;

@end
