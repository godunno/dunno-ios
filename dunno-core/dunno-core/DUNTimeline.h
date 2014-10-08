//
//  DUNTimeline.h
//  dunno-core
//
//  Created by Wanderley Miyata on 9/19/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DUNTimeline : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSDate *startAt;
@property (nonatomic, readonly, copy) NSDate *updatedAt;
@property (nonatomic, readonly, copy) NSArray *messages;

@end