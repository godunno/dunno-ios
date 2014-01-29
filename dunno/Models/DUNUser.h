#import "NSObject+DUNJsonParser.h"

@interface DUNUser : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *pictureURLString;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end
