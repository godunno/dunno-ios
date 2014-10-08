//
//  MenuItem.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDMenuItem.h"

@implementation PDMenuItem

- (id)initWithIcon:(NSString*)icon title:(NSString*)title key:(NSInteger)key {
    self = [super init];
    
    if (self) {
        _icon = icon;
        _title = title;
        _key = key;
    }
    
    return self;
}

@end
