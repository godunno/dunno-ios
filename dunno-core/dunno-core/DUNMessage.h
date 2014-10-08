//
//  DUNMessage.h
//  dunno-core
//
//  Created by Wanderley Miyata on 9/28/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "DUNStudent.h"

@interface DUNMessage : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *content;
@property (nonatomic, readonly, copy) NSDate *createdAt;
@property (nonatomic, readonly, copy) DUNStudent *author;
@property (nonatomic, readonly, assign) NSInteger upVotes;
@property (nonatomic, readonly, assign) NSInteger downVotes;

@end