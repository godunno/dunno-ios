#import "DUNEstimote.h"
#import <EstimoteSDK/ESTBeacon.h>
#import <EstimoteSDK/ESTBeaconManager.h>


static NSString * const ESTIMOTE_DEFAULT_UUID = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D";
static NSString * const DUNNO_BEACONS_ESTIMOTE_IDENTIFIER = @"vc.dunno.beacons.estimote";
static long const PUC_GROUP_MAJOR_IDENTIFIER = 666;

@interface DUNEstimote() <ESTBeaconManagerDelegate>

@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion *beaconRegion;

@end

@implementation DUNEstimote

- (void) startSeek
{
  self.beaconManager = [[ESTBeaconManager alloc] init];
  self.beaconManager.delegate = self;
  
  self.beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID major:PUC_GROUP_MAJOR_IDENTIFIER identifier:DUNNO_BEACONS_ESTIMOTE_IDENTIFIER];
                       
  [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
}

#pragma mark -
#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
  self.beaconsDetected = beacons;
}

@end
