#import "JSONModel.h"

@protocol DUNTopic
@end

@interface DUNTopic : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *title;

@end
