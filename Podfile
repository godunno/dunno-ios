platform :ios, '7.0'

inhibit_all_warnings!

xcodeproj 'dunno'

pod 'NSString+Ruby'
pod 'ObjectiveSugar'

# controllers / flow
pod 'EAIntroView'

#visual
pod 'MBProgressHUD'
pod 'FlatUIKit'
pod 'SDCAlertView'
pod 'EstimoteSDK'
pod 'MJPopupViewController', :git => 'https://github.com/seufagner/MJPopupViewController'

pod 'dunno-shared', :path => '../dunno-shared'
#pod 'dunno-shared', :git => "https://github.com/godunno/dunno-shared.git"

target :dunnoTests, :exclusive => true do
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMockito'
  pod 'OCMock'
end