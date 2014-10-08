//
//  DUNStudent.h
//  dunno-core
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DUNStudent : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSString *avatar;

@end
