platform :ios, '7.0'

inhibit_all_warnings!

xcodeproj 'dunno'

pod 'AFNetworking'
pod 'SDWebImage'

#dates
pod 'ISO8601DateFormatter'
pod 'NSDate+Calendar'

# controllers / flow
pod 'EAIntroView'

#visual
pod 'MJPopupViewController', :git => 'https://github.com/seufagner/MJPopupViewController'
pod 'MBProgressHUD'
pod 'FlatUIKit'
pod 'HexColors'

pod 'dunno-shared', :path => '../dunno-shared'
#pod 'dunno-shared', :git => "https://github.com/godunno/dunno-shared.git"

target :dunnoTests, :exclusive => true do
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMockito'
end