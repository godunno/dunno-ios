#import "JSONModel.h"

@interface DUNUser : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString<Optional> * avatarURLString;

@end
