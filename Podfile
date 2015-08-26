source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Alamofire', '2.0.0-beta.3'
pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git', :commit => 'f269523ac572979245baa99c8475eab73caf1e9b'
pod 'Swinject', '~> 0.2.1'


def testing_pods
    pod 'Quick', :git => 'https://github.com/Quick/Quick.git', :commit => '1fbcd8a05f6e896e2db66a2e82527b7f24766ef8'
    pod 'Nimble', :git => 'https://github.com/Quick/Nimble.git', :commit => 'e3e3978ef610927d70eafd333e162855ad7b6f77'
end

target 'SwinjectSimpleExampleTests' do
    testing_pods
end

#target 'SwinjectSimpleExampleUITests' do
#    testing_pods
#end
