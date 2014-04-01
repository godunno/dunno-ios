#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "DUNAPI.h"
#import "DUNPusher.h"
#import "DUNEvent.h"

#define HC_SHORTHAND // needed by OCMockito
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

SpecBegin(DUNSession)

describe(@"DUNSession", ^{
  
  context(@"#clearActiveEvent", ^{
    
    it(@"change activeEvent to nil", ^{
      DUNSession *session = [DUNSession sharedInstance];
      session.activeEvent = [[DUNEvent alloc] init];
      [session clearActiveEvent];
      
      expect(session.activeEvent).to.beNil();
    });

    it(@"call DUNPusher#unsubscribe using DUNEvent#channelName", ^{
      //how test dependency (IoC to objective-c?)
      DUNSession *session = [DUNSession sharedInstance];
      session.activeEvent = [[DUNEvent alloc] init];
      [session clearActiveEvent];
      
      DUNPusher *pusher = mock([DUNPusher class]);
      [verifyCount(pusher, atLeast(1)) unsubscribe:session.activeEvent.channelName];
    });
    
  });
  
});

SpecEnd
