#import "DUNEstimote.h"
#import <EstimoteSDK/ESTBeacon.h>
#import <EstimoteSDK/ESTBeaconManager.h>

@interface DUNEstimote() <ESTBeaconManagerDelegate>

@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion *beaconRegion;

@property (nonatomic, strong) ESTBeacon         *beaconDetected;

@end

@implementation DUNEstimote

- (instancetype) init
{
  if(self = [super init])
  {
    [self setupBeacon];
  }
  return self;
}

- (void) setupBeacon
{
  _beaconManager = [[ESTBeaconManager alloc] init];
  _beaconManager.delegate = self;
  
  _beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                      identifier:@"PUC"];
  [_beaconManager startRangingBeaconsInRegion:_beaconRegion];
}

#pragma mark -
#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
  NSLog(@"---%@",[self textForProximity:((ESTBeacon*)beacons[0]).proximity]);
  if(((ESTBeacon*)beacons[0]).proximity == CLProximityImmediate)
  {
    [self initializeBeaconNotifications:beacons[0]];// use first
  }
}

- (void)beaconManager:(ESTBeaconManager *)manager didEnterRegion:(ESTBeaconRegion *)region
{
  if(_beaconDetected.proximity == CLProximityImmediate)
  {
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Vem assistir a aula no dunno rapaz!!!";
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
  }
  
}

- (void)beaconManager:(ESTBeaconManager *)manager didExitRegion:(ESTBeaconRegion *)region
{
  UILocalNotification *notification = [UILocalNotification new];
  notification.alertBody = @"Exit region notification";
  
  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (NSString *)textForProximity:(CLProximity)proximity
{
  switch (proximity) {
    case CLProximityFar:
      return @"Far";
      break;
    case CLProximityNear:
      return @"Near";
      break;
    case CLProximityImmediate:
      return @"Immediate";
      break;
      
    default:
      return @"Unknown";
      break;
  }
}

#pragma mark -
#pragma mark - Private


- (void) initializeBeaconNotifications:(ESTBeacon*)beacon
{
  NSParameterAssert(beacon);
  
  _beaconDetected = beacon;
  _beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:_beaconDetected.proximityUUID
                                                           major:[_beaconDetected.major unsignedIntValue]
                                                           minor:[_beaconDetected.minor unsignedIntValue]
                                                      identifier:@"PUC-TEST"];
  _beaconRegion.notifyOnEntry = TRUE;
  _beaconRegion.notifyOnExit = TRUE;
  
  [_beaconManager startMonitoringForRegion:_beaconRegion];
  
  
  UILocalNotification *notification = [UILocalNotification new];
  notification.alertBody = @"Vem assistir a aula no dunno rapaz!!!";
  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

@end
