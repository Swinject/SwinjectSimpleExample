source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def swinject_pods
    pod 'Swinject', '2.0.0-beta.2'
    pod 'SwinjectStoryboard', '1.0.0-beta.2'
end

target :SwinjectSimpleExample do
  pod 'Alamofire', '~> 4.0'
  pod 'SwiftyJSON', '~> 3.1'
  swinject_pods
end

def testing_pods
    pod 'Quick', '0.10'
    pod 'Nimble', '5.0'
    swinject_pods
end

target 'SwinjectSimpleExampleTests' do
    testing_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # https://github.com/CocoaPods/CocoaPods/issues/5521
            # Now that we've updated to Swift 3, ensure that CocoaPods specify the correct version setting for all targets
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
