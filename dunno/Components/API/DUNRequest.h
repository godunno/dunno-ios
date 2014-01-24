#import <Foundation/Foundation.h>

typedef void (^StringBlock)(NSString *string);
typedef void (^ArrayBlock)(NSArray *array);
typedef void (^DictionaryBlock)(NSDictionary *dict);
typedef void (^BooleanBlock)(BOOL *param);
typedef void (^BlockUIImage)(UIImage *image);
typedef void (^BlockNSArray)(NSArray *array);
typedef void (^VoidBlock)(void);

typedef void (^ErrorBlock)(NSError *error);

@interface DUNRequest : NSObject

+ (void) post:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL))success failure:(void (^)(NSError *))failure;

+ (void) get:(NSString*)url
     success:(void (^)(NSDictionary *json))success
     failure:(ErrorBlock)failure;

@end
