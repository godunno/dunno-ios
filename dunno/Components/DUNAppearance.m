#import "DUNAppearance.h"

@implementation DUNAppearance

+(void) applyGlobalAppearance
{
  [[UINavigationBar appearance] setBarTintColor:[DUNStyles backgroundColor]];
}

@end
