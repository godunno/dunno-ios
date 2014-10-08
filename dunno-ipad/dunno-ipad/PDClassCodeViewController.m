//
//  PDClassCodeViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 10/1/14.
//  Copyright (c) 2014 Dunno Solucoes Educacionais. All rights reserved.
//

#import "PDClassCodeViewController.h"
#import "UIFont+Dunno.h"
#import "UIFont+Lato.h"

@interface PDClassCodeViewController ()

@end

@implementation PDClassCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // configure styles
    self.view.backgroundColor = [UIColor blackColor]; // UIColorFromRGB(0x26666C);
    
    _codeLabel.font = [UIFont latoWithSize:150.0];
    _codeLabel.textColor = [UIColor whiteColor];
    _codeLabel.text = _classCode;

    // configure handler
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)close {
    // dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
