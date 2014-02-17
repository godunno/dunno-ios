#import "JSONModel.h"
#import "DUNEvent.h"

@interface DUNOrganization : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<DUNEvent> *events;

@end
