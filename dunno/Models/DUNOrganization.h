#import "NSObject+DUNJsonParser.h"

@interface DUNOrganization : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *name;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end
