#import "DUNBeaconManager.h"

#import <EstimoteSDK/ESTBeaconManager.h>
#import <EstimoteSDK/ESTBeacon.h>

#define DUNNO_BEACONS_ESTIMOTE_IDENTIFIER @"vc.dunno.beacons.estimote"
#define ESTIMOTE_DEFAULT_UUID @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"
#define PUC_GROUP_MAJOR_IDENTIFIER 666

@interface DUNBeaconManager() <ESTBeaconManagerDelegate>
@property (nonatomic, strong) DUNEstimote *estimote;
@property (nonatomic, strong) ESTBeacon *beacon;
@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion *beaconRegion;
@end

@implementation DUNBeaconManager


- (instancetype)initWithBeacon:(DUNEstimote*)estimote
{
  if ((self = [super init]))
  {
    [self setup:estimote];
  }

  return self;
}

- (void) setup:(DUNEstimote*)estimote
{
  NSParameterAssert(self.estimote);
  NSParameterAssert(self.estimote.proximityUUID);
  NSParameterAssert(self.estimote.self.majorIdentifier);
  NSParameterAssert(self.estimote.self.minorIdentifier);
  
  self.beacon = [[ESTBeacon alloc] init];
  self.beacon.proximityUUID = [[NSUUID alloc] initWithUUIDString:self.estimote.proximityUUID];
  self.beacon.major = self.estimote.majorIdentifier;
  self.beacon.minor = self.estimote.minorIdentifier;
  
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

@end
