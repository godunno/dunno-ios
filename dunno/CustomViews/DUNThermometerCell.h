#import "DUNEvent.h"

#import "FUIButton.h"

#define kThermometerCell @"ThermometerCellId"

@interface DUNThermometerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *questionTextView;

@property (weak, nonatomic) IBOutlet UISlider *thermometerSlider;

@property (weak, nonatomic) IBOutlet FUIButton *sendRatingButton;

@property (nonatomic, strong) DUNThermometer *thermometer;

@end
