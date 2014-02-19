#import "DUNOrganization.h"
#import "DUNEvent.h"
#import "DUNStudent.h"

@interface DUNSession : NSObject

@property (nonatomic, strong) DUNOrganization *currentOrganization;
@property (nonatomic, strong) DUNEvent *currentEvent;
@property (nonatomic, copy) NSString *userChannel;
@property (nonatomic, strong) DUNStudent *currentStudent;

+ (instancetype) sharedInstance;

+ (BOOL) hasActiveEvent;

@end
