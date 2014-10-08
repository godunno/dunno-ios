//
//  UITextField.m
//  dunno-core
//
//  Created by Wanderley Miyata on 9/21/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "UITextField+Dunno.h"
#import "UIFont+Lato.h"
#import "UIColor+Dunno.h"

@implementation UITextField (Dunno)

- (void)transparentStyleWithPlaceholder:(NSString*)placeholder {    
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    self.font = [UIFont latoWithSize:17.0];
    self.borderStyle = UITextBorderStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

@end
