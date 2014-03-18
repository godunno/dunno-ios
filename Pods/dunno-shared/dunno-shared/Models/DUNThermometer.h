#import "JSONModel.h"

@protocol DUNThermometer
@end

@interface DUNThermometer : JSONModel

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *content;


@end
