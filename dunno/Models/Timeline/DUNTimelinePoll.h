#import "JSONModel.h"

@interface DUNTimelinePoll : JSONModel

@property (nonatomic, copy) NSString *question;

@property (nonatomic, strong) NSArray *options;

@end
