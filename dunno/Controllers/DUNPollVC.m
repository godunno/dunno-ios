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
  
  NSParameterAssert(_session.currentPoll!=nil);
  
  _sendAnswerButton = [DUNStyles customizeOKButton:_sendAnswerButton];
  
  _questionTextView.text = _session.currentPoll.content;
}

- (IBAction)sendAnswer:(id)sender
{
  NSString *pollUUID = ((DUNPollOption*)_session.currentPoll.options[[_optionPicker selectedRowInComponent:0]]).uuid;
  
  [DUNAPI sendAnswerPollOptionUUID:pollUUID success:^{
    
    [self.navigationController popViewControllerAnimated:TRUE];
    
  } error:^(NSError *error) {
    //TODO show generic 'modal'/'view' with error
    NSLog(@"deu merda enviando Poll Answer");
  }];
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return [_session.currentPoll.options count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return ((DUNPollOption*)_session.currentPoll.options[row]).content;
}

@end
