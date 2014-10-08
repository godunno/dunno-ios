//
//  MenuItem.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDMenuItem : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger key;

- (id)initWithIcon:(NSString*)icon title:(NSString*)title key:(NSInteger)key;

@end
