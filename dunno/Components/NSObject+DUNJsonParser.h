#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"
#import "DCArrayMapping.h"

@protocol DUNJsonParseable <NSObject>
@optional
+ (NSDictionary*)mappings;
@end

@interface NSObject (DUNJsonParser)

+ (id) instanceFromJsonDictionary:(NSDictionary*)jsonDic;

+ (DCParserConfiguration*)defaultParserConfig;

+ (DCParserConfiguration*) addToConfig:(DCParserConfiguration**)config mappings:(Class<DUNJsonParseable>)parseableClass;

@end
