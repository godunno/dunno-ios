//
//  UIButton.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "UIButton+Dunno.h"
#import "UIFont+Lato.h"
#import "UIColor+Dunno.h"

@implementation UIButton (Dunno)

//+ (UIButton*)greenButtonWithTitle:(NSString*)title {
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    [button setBackgroundColor:[UIColor dunnoGreenColor]];
//    button.titleLabel.font = [UIFont latoWithSize:17.0];
//    button.titleLabel.textColor = [UIColor whiteColor];
//    [button setTitle:title forState:UIControlStateNormal];
//    
//    button.layer.cornerRadius = 5.0;
//    
//    return button;
//}

- (void)greenStyle {
    UIImage *originalImage = [UIImage imageNamed:@"green-button"];
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 5, 5, 5);
    UIImage *stretchableImage = [originalImage resizableImageWithCapInsets:insets];
    [self setBackgroundImage:stretchableImage forState:UIControlStateNormal];
    
    self.titleLabel.font = [UIFont latoWithSize:17.0];
    self.titleLabel.textColor = [UIColor whiteColor];
}

- (void)darkStyle {
    self.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 5.0;
}


@end
