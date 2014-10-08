//
//  DUNTopic.h
//  dunno-core
//
//  Created by Wanderley Miyata on 9/8/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DUNTopic : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *Description;
@property (nonatomic, readonly, copy) NSString *order;
@property (nonatomic, readonly, copy) NSString *uuid;

@end
