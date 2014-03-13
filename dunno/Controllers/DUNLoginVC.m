#import "DUNAPI.h"
#import "DUNStudent.h"
#import "DUNLoginVC.h"
#import "DUNProfileVC.h"

#define kDUNInitialNVC @"DUNInitialNVC"

@interface DUNLoginVC ()<UITextFieldDelegate>

@property (strong, nonatomic) DUNSession *session;

@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;
@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet FUIButton *loginButton;

@end

@implementation DUNLoginVC

- (void)viewDidLoad
{
  [super viewDidLoad];
}


- (IBAction)login:(id)sender
{
  NSString *username = _usernameTextField.text;
  NSString *password = _passwordTextField.text;
  
  //show errors if user dont input the username
  //show errors if user dont input the password

  [DUNAPI loginStudentUsername:@"dow@dunno.vc" withPassword:@"#dunnovc" success:^(DUNStudent *student) {
    
    _session = [DUNSession sharedInstance];
    
    _session.currentStudent = student;
    _session.currentOrganization = student.organization;
    
    UINavigationController *nvc = [self.storyboard instantiateViewControllerWithIdentifier:kDUNInitialNVC];
    
    [self presentViewController:nvc animated:YES completion:nil];    
    
  } error:^(NSError *error) {
    [DUNErrorVC showWithTitle:@"Login" andMessage:@"Erro no login."];
  }];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  //hides keyboard when another part of layout was touched
  [self.view endEditing:YES];
  [super touchesBegan:touches withEvent:event];
}



@end
