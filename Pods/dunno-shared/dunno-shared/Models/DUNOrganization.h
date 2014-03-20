#import "JSONModel.h"
#import "DUNCourse.h"

@interface DUNOrganization : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<DUNCourse, Optional> *courses;

@end
