#import "DUNPollVC.h"

#import "DUNAPI.h"

#import "DUNPoll.h"
#import "DUNPollOption.h"

#import "FUIButton.h"

@interface DUNPollVC()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) DUNSession *session;

@property (nonatomic, weak) IBOutlet UITextView *questionTextView;
@property (nonatomic, weak) IBOutlet UIPickerView *optionPicker;
@property (nonatomic, weak) IBOutlet FUIButton *sendAnswerButton;

@end

@implementation DUNPollVC

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _session = [DUNSession sharedInstance];
  
  _sendAnswerButton = [DUNStyles customizeOKButton:_sendAnswerButton];
  
  _questionTextView.text = self.currentPoll.content;
}

- (void)viewWillAppear:(BOOL)animated
{
  NSParameterAssert(self.currentPoll!=nil);
  
  [super viewWillAppear:animated];
}

- (IBAction)sendAnswer:(id)sender
{
  NSString *pollUUID = ((DUNPollOption*)self.currentPoll.options[[_optionPicker selectedRowInComponent:0]]).uuid;
  
  [DUNAPI sendAnswerPollOptionUUID:pollUUID success:^{
    
    [self.navigationController popViewControllerAnimated:TRUE];
    
  } error:^(NSError *error) {
    [DUNErrorVC showWithTitle:@"Enquete" andMessage:@"Erro enviando resposta da enquete."];
  }];
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return [self.currentPoll.options count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return ((DUNPollOption*)self.currentPoll.options[row]).content;
}

@end
