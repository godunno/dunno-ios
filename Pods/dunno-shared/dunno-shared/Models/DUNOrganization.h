#import "JSONModel.h"

@protocol DUNCourse;

@interface DUNOrganization : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<DUNCourse, Optional> *courses;

@end
