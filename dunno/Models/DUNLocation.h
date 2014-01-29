#import "NSObject+DUNJsonParser.h"

@interface DUNLocation : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *complement;
@property (nonatomic, copy) NSString *neighborhood;
@property (nonatomic, copy) NSString *city;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end
