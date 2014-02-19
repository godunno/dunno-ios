#import "JSONValueTransformer+NSDate.h"
#import <ISO8601DateFormatter.h>

@implementation JSONValueTransformer (NSDate)

- (NSDate*) NSDateFromNSString:(NSString*)string
{
  ISO8601DateFormatter *dateFormatter = [[ISO8601DateFormatter alloc] init];
  NSDate *date = [dateFormatter dateFromString: string];
  return date;
}

- (NSString*)JSONObjectFromNSDate:(NSDate*)date
{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
  
  return [dateFormatter stringFromDate:date];
}

@end
