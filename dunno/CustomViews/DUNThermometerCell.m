#import "DUNAPI.h"
#import "DUNThermometerCell.h"

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
  
  NSDecimalNumber *ratingValue = (NSDecimalNumber*)[NSNumber numberWithFloat:_thermometerSlider.value];
  
  [DUNAPI sendThermometer:_thermometer withRatingValue:ratingValue success:^{
    
    NSLog(@"enviou thermometer com sucesso..");
    
  } error:^(NSError *error) {
    //TODO show generic 'modal'/'view' with error
    NSLog(@"deu merda enviando rating do termometro");
  }];
}

@end
