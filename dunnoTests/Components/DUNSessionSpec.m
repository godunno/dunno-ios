#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "DUNAPI.h"
#import "DUNPusher.h"
#import "DUNEvent.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

SpecBegin(DUNSession)

describe(@"DUNSession", ^{
  
  __block DUNEvent *event = mock([DUNEvent class]);
  __block  DUNPusher *pusher = mock([DUNPusher class]);
  __block DUNSession *session = [DUNSession sharedInstance];
  
  beforeEach(^{
    [given(event.channelName) willReturn:@"foo-channel"];
    session.activeEvent = event;
    session.pusher = pusher;
  });
  
  describe(@"properties", ^{
    expect([session respondsToSelector:@selector(currentStudent)]).to.beTruthy();
    expect([session respondsToSelector:@selector(activeEvent)]).to.beTruthy();
    expect([session respondsToSelector:@selector(currentPoll)]).to.beTruthy();
  });
  
  describe(@"#clearActiveEvent", ^{
    
    it(@"change activeEvent to nil", ^{
      [session clearActiveEvent];
      
      expect(session.activeEvent).to.beNil();
    });
    
    it(@"call DUNPusher#unsubscribe using DUNEvent#channelName", ^{
      
      [verifyCount(pusher, times(1)) unsubscribe:session.activeEvent.channelName];
      
      [session clearActiveEvent];
    });
    
  });
  
});

SpecEnd
