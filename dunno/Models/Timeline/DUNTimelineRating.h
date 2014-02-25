#import "JSONModel.h"

@interface DUNTimelineRating : JSONModel

@property (nonatomic, copy) NSString *question;

@property (nonatomic, assign) float rating;

@end
