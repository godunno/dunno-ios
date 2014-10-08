//
//  DUNPersonalNote.h
//  dunno-core
//
//  Created by Wanderley Miyata on 9/18/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DUNPersonalNote : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *content;
@property (nonatomic, readonly, assign) NSString *order;

@end
