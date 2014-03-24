#import "DUNUser.h"

@protocol DUNEvent;

@protocol DUNStudent
@end

@interface DUNStudent : DUNUser

@property (nonatomic, copy) NSString<Optional> * avatarURLString;
@property (nonatomic, copy) NSString<Optional> *authToken;
@property (nonatomic, strong) NSArray<DUNEvent, Optional> *events;

@end