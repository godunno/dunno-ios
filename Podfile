platform :ios, '7.0'

inhibit_all_warnings!

xcodeproj 'dunno'

# network
pod 'AFNetworking', '~> 1.0'
pod 'Reachability', '~> 3.1.1'
pod 'SDWebImage', '~> 3.5'

#dates
pod 'ISO8601DateFormatter', '~> 0.7'
pod 'NSDate+Calendar'

# controllers / flow
pod 'EAIntroView', '~> 2.3.0'

#visual
pod 'MJPopupViewController', :git => 'https://github.com/seufagner/MJPopupViewController'
pod 'MBProgressHUD', '~> 0.8'
pod 'FlatUIKit'
pod 'HexColors'

pod 'dunno-shared', :path => '../dunno-shared'
#pod 'dunno-shared', :git => "https://github.com/godunno/dunno-shared.git"

target :dunnoTests, :exclusive => true do
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMockito'
end