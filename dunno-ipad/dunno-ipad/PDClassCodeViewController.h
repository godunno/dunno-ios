//
//  PDClassCodeViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDClassCodeViewController : UIViewController

@property (nonatomic, strong) NSString *classCode;
@property (nonatomic, weak) IBOutlet UILabel *codeLabel;

@end
