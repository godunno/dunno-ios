//
//  DUNUserMessage.h
//  dunno
//
//  Created by fagner feitosa on 1/22/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DUNUser.h"

@interface DUNTimelineUserMessage : NSObject

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, strong) DUNUser *owner;
@property (nonatomic, copy) NSString *profilePicture;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger upVoteCount;
@property (nonatomic, assign) NSInteger downVoteCount;

- (void) addOneUpVote;
- (void) addOneDownVote;

@end
