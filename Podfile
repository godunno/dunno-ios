platform :ios, '7.0'

inhibit_all_warnings!

xcodeproj 'dunno'

# controllers / flow
pod 'EAIntroView', '~> 2.3.0'

pod 'dunno-shared', :path => '../dunno-shared'
#pod 'dunno-shared', :git => "https://github.com/godunno/dunno-shared.git"

target :dunnoTests, :exclusive => true do
  pod 'Specta',      '~> 0.2.1'
  pod 'Expecta',     '~> 0.2.3'
  #pod 'OCHamcrest',  '~> 3.0.0'
  pod 'OCMockito',   '~> 1.0.0'
end