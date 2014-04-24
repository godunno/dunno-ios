#import "DUNEstimote.h"

#import <EstimoteSDK/ESTBeaconManager.h>
#import <EstimoteSDK/ESTBeacon.h>

#define DUNNO_BEACONS_ESTIMOTE_IDENTIFIER @"vc.dunno.beacons.estimote"
#define ESTIMOTE_DEFAULT_UUID @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"
#define PUC_GROUP_MAJOR_IDENTIFIER 666

@interface DUNEstimote() <ESTBeaconManagerDelegate>
@property (nonatomic, strong) ESTBeacon *beacon;
@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion *beaconRegion;
@end

@implementation DUNEstimote

- (void)initialize
{
  NSParameterAssert(self.proximityUUID);
  NSParameterAssert(self.majorIdentifier);
  NSParameterAssert(self.minorIdentifier);
  
  self.beacon = [[ESTBeacon alloc] init];
  self.beacon.proximityUUID = [[NSUUID alloc] initWithUUIDString:self.proximityUUID];
  self.beacon.major = self.majorIdentifier;
  self.beacon.minor = self.minorIdentifier;
  
  self.beaconManager = [[ESTBeaconManager alloc] init];
  self.beaconManager.delegate = self;
  
  self.beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID major:[self.beacon.major longValue] minor:[self.beacon.minor longValue] identifier:DUNNO_BEACONS_ESTIMOTE_IDENTIFIER];
  
  [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
}

#pragma mark -
#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
  ESTBeacon *beaconFound =  beacons[0];
  
  if(beaconFound.proximity==CLProximityImmediate) {
    NSLog(@"attend event through beacon!!!!");
  }
  
}

#pragma mark -
#pragma mark - Private


@end
