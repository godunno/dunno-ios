//
//  UIColor.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "UIColor+Dunno.h"

#define DUNNO_GRAY 0x214C50

@implementation UIColor (Dunno)

+ (UIColor*)dunnoDarkGrayColor {
    return UIColorFromRGB(0x2B3738);
}

+ (UIColor*)dunnoGreenColor {
    return UIColorFromRGB(0x1CC678);
}

+ (UIColor*)dunnoSchema1 {
    return UIColorFromRGB(0xfedd59);
}

+ (UIColor*)dunnoSchema2 {
    return UIColorFromRGB(0x54c5ff);
}

+ (UIColor*)dunnoSchema3 {
    return UIColorFromRGB(0xff926a);
}

+ (UIColor*)dunnoSchema4 {
    return UIColorFromRGB(0xa893ff);
}

+ (UIColor*)dunnoGray100Color {
    return UIColorFromRGB(DUNNO_GRAY);
}
+ (UIColor*)dunnoGray80Color {
    return UIColorFromRGBAlpha(DUNNO_GRAY, 0.8);
}
+ (UIColor*)dunnoGray60Color {
    return UIColorFromRGBAlpha(DUNNO_GRAY, 0.6);
}
+ (UIColor*)dunnoGray40Color {
    return UIColorFromRGBAlpha(DUNNO_GRAY, 0.4);
}
+ (UIColor*)dunnoGray20Color {
    return UIColorFromRGBAlpha(DUNNO_GRAY, 0.2);
}

@end
