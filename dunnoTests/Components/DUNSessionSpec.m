#import "DUNSpecHelper.h"

#import "DUNAPI.h"
#import "DUNPusher.h"
#import "DUNEvent.h"

SpecBegin(DUNSession)

describe(@"DUNSession", ^{
  
  __block DUNEvent *event;
  __block DUNPusher *pusher;
  __block DUNSession *session;
  
  before(^{
    session = [DUNSession sharedInstance];
    pusher = mock([DUNPusher class]);
    event = mock([DUNEvent class]);
    [given(event.channelName) willReturn:@"foo-channel"];
    
    session.activeEvent = event;
    session.pusher = pusher;
  });
  
  describe(@"#clearActiveEvent", ^{
    it(@"do nothing if activeEvent will be nil", ^{
      session.activeEvent = nil;
      [session clearActiveEvent];
      [verifyCount(pusher, never()) unsubscribe:event.channelName];
    });
    
    it(@"call DUNPusher#unsubscribe using DUNEvent#channelName", ^{
      [session clearActiveEvent];
      [verify(pusher) unsubscribe:event.channelName];
    });
    
    it(@"change activeEvent to nil", ^{
      [session clearActiveEvent];
      expect(session.activeEvent).to.beNil();
    });
    
  });
  
});

SpecEnd
