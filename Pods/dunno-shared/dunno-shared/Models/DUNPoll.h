#import "JSONModel.h"

@protocol DUNPollOption;

@protocol DUNPoll
@end

@interface DUNPoll : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) NSArray<DUNPollOption> *options;

@end
