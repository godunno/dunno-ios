//
//  AppDelegate.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 9/6/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DUNUser.h"

@interface PDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DUNUser *currentUser;

@end
