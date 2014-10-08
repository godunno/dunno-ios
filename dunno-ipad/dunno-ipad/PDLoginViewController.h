//
//  LoginViewController.h
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDLoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *emailText;
@property (nonatomic, strong) IBOutlet UITextField *passwordText;

@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) IBOutlet UIButton *subscribeButton;

@property (nonatomic, strong) IBOutlet UILabel *instructionsLabel;

- (IBAction)login:(id)sender;
- (IBAction)subscribe:(id)sender;

@end
