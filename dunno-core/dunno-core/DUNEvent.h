//
//  DUNEvent.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "DUNCourse.h"
#import "DUNTimeline.h"

@interface DUNEvent : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, assign) NSInteger eventId;
@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *channel;
@property (nonatomic, readonly, copy) NSString *status;
@property (nonatomic, readonly, assign) NSInteger order;
@property (nonatomic, readonly, copy) NSDate *startAt;
@property (nonatomic, readonly, copy) NSDate *endAt;
@property (nonatomic, readonly, copy) NSString *studentMessageEvent;
@property (nonatomic, readonly, copy) NSString *upDownVoteMessageEvent;
@property (nonatomic, readonly, copy) DUNCourse *course;
@property (nonatomic, readonly, copy) NSArray *topics;
@property (nonatomic, readonly, copy) NSArray *personalNotes;
@property (nonatomic, readonly, copy) DUNTimeline *timeline;

@end
