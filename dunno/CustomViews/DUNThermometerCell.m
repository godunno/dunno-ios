#import "DUNAPI.h"
#import "DUNThermometerCell.h"
#import "DUNThermometer.h"

@interface DUNThermometerCell()<UIAlertViewDelegate>
@end

@implementation DUNThermometerCell

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  _sendRatingButton = [DUNStyles customizeOKButton:_sendRatingButton];
  
  _thermometerSlider.maximumValue = 100;
  _thermometerSlider.minimumValue= 0;
  
}


- (void)setThermometer:(DUNThermometer *)thermometer
{
  NSParameterAssert(thermometer!=nil);
  
  _thermometer = thermometer;
  
  _questionTextView.text = thermometer.content;
  
}

- (IBAction)sendRating:(id)sender
{
  NSString* ratingValue = [NSString stringWithFormat:@"%.02f", _thermometerSlider.value];
  
  [DUNAPI sendThermometer:_thermometer withRatingValue:ratingValue success:^{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"Avaliação enviada: %@%%", ratingValue] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
  } error:^(NSError *error) {
    [DUNErrorVC showWithTitle:@"Termômetro" andMessage:@"Erro enviando rating do Termômetro."];
  }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  _sendRatingButton.hidden = TRUE;
}

@end
