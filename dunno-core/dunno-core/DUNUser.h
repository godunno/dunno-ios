//
//  DUNTeacher.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DUNUser : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *authenticationToken;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, assign) NSInteger userId;
@property (nonatomic, readonly, copy) NSString *name;

@end
