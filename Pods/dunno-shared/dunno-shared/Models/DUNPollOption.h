#import "JSONModel.h"

@protocol DUNPollOption
@end

@interface DUNPollOption : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *content;

@end
