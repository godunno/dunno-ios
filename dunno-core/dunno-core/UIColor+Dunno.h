//
//  UIColor.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBAlpha(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

@interface UIColor (Dunno)

+ (UIColor*)dunnoDarkGrayColor;

+ (UIColor*)dunnoGreenColor;

+ (UIColor*)dunnoGray100Color;
+ (UIColor*)dunnoGray80Color;
+ (UIColor*)dunnoGray60Color;
+ (UIColor*)dunnoGray40Color;
+ (UIColor*)dunnoGray20Color;

+ (UIColor*)dunnoSchema1;
+ (UIColor*)dunnoSchema2;
+ (UIColor*)dunnoSchema3;
+ (UIColor*)dunnoSchema4;

@end
