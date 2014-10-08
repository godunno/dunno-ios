//
//  DUNClass.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/1/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DUNClass : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *class_name;
@property (nonatomic, strong) NSString *institution;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *schedule;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *classOrder;

- (id)initWithName:(NSString*)name class_name:(NSString*)class_name institution:(NSString*)institution day:(NSString*)day month:(NSString*)month time:(NSString*)time schedule:(NSString*)schedule status:(NSString*)status classOrder:(NSString*)classOrder;

@end
