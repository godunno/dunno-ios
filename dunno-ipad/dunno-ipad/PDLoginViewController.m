//
//  LoginViewController.m
//  dunno-ipad
//
//  Created by Wanderley Miyata on 8/28/14.
//  Copyright (c) 2014 BlueScreen Sistemas. All rights reserved.
//

#import "PDLoginViewController.h"
#import "UIColor+Dunno.h"
#import "UIFont+Lato.h"
#import "UIButton+Dunno.h"
#import "DUNAPI.h"
#import "DUNUser.h"
#import "PDAppDelegate.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface PDLoginViewController ()

@end

@implementation PDLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // configure layout
    self.view.backgroundColor = [UIColor dunnoDarkGrayColor];
    
    // login button
    [_loginButton greenStyle];
    _loginButton.titleLabel.font = [UIFont latoWithSize:17.0];
    
    // subscribe button
    [_subscribeButton darkStyle];
    _subscribeButton.titleLabel.font = [UIFont latoWithSize:17.0];
    
    // email field
    _emailText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    _emailText.font = [UIFont latoWithSize:19.0];
    
    // password field
    _passwordText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Senha" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    _passwordText.font = [UIFont latoWithSize:19.0];
    
    // instructions text
    _instructionsLabel.font = [UIFont latoWithSize:13.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Actions

- (IBAction)login:(id)sender {
    // resign responders
    [self.view endEditing:YES];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // do login
    [[DUNAPI sharedInstance] loginUserWithEmail:_emailText.text password:_passwordText.text success:^(DUNUser *user) {

        // load app delegate
        PDAppDelegate *app = [[UIApplication sharedApplication] delegate];
        app.currentUser = user;
        
        // dismiss login
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } error:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];

        // something wrong...
        [[[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Usuário/Senha inválido(s)" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
}

- (IBAction)subscribe:(id)sender {
    //TODO: handle subscribe
}

@end
