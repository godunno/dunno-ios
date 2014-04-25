#import <Mantle/Mantle.h>

@interface DUNEstimote : MTLModel

@property (nonatomic, readonly, copy) NSString *entityId;
@property (nonatomic, readonly, copy) NSString *proximityUUID;
@property (nonatomic, readonly, strong) NSNumber *majorIdentifier;
@property (nonatomic, readonly, strong) NSNumber *minorIdentifier;

@end
