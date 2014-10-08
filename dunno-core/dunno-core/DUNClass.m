//
//  DUNClass.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "DUNClass.h"

@implementation DUNClass

- (id)initWithName:(NSString*)name class_name:(NSString*)class_name institution:(NSString*)institution day:(NSString*)day month:(NSString*)month time:(NSString*)time schedule:(NSString*)schedule status:(NSString*)status classOrder:(NSString*)classOrder {
    self = [super init];
    
    if (self) {
        _name = name;
        _class_name = class_name;
        _institution = institution;
        _day = day;
        _month = month;
        _time = time;
        _schedule = schedule;
        _status = status;
        _classOrder = classOrder;
    }
    
    return self;
}

@end
