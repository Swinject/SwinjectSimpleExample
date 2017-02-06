source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def swinject_pods
    pod 'Swinject', '2.0.0'
    pod 'SwinjectStoryboard', '1.0.0'
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
