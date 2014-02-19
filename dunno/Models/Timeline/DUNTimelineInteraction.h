#import "JSONModel.h"

typedef NS_ENUM(NSUInteger, DUNTimelineInteractionType) {
  DUNTimelineInteractionMessage,
  DUNTimelineInteractionPoll,
  DUNTimelineInteractionRating,
};


@interface DUNTimelineInteraction : JSONModel

- (DUNTimelineInteractionType) type;

@end

