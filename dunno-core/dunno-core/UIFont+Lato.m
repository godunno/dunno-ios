//
//  UIFont.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "UIFont+Lato.h"

@implementation UIFont (Lato)

+ (UIFont*)latoBlackWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-Black" size:fontSize];
}

+ (UIFont*)latoBlackItalicWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-BlackItalic" size:fontSize];
}

+ (UIFont*)latoBoldWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-Bold" size:fontSize];
}

+ (UIFont*)latoBoldItalicWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-BoldItalic" size:fontSize];
}

+ (UIFont*)latoHairlineWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-Hairline" size:fontSize];
}

+ (UIFont*)latoHairlineItalicWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-HairlineItalic" size:fontSize];
}

+ (UIFont*)latoItalicWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-Italic" size:fontSize];
}

+ (UIFont*)latoLightWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-Light" size:fontSize];
}

+ (UIFont*)latoLightItalicWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-LightItalic" size:fontSize];
}

+ (UIFont*)latoWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Lato-Regular" size:fontSize];
}

@end
