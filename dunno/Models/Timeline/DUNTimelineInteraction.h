
typedef NS_ENUM(NSUInteger, DUNTimelineInteractionType) {
  DUNTimelineInteractionMessage,
  DUNTimelineInteractionPoll,
  DUNTimelineInteractionRating,
};


@interface DUNTimelineInteraction : NSObject

- (DUNTimelineInteractionType) type;

@end
