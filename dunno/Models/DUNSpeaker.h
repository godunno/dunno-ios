#import "NSObject+DUNJsonParser.h"

@interface DUNSpeaker : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *pictureURLString;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end
