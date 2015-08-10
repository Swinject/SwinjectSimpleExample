//
//  WeatherTablerViewControllerSpec.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import SwinjectSimpleExample

class WeatherTablerViewControllerSpec: QuickSpec {
    class MockNetwork: Networking {
        var requestCount = 0
        
        func request(response: NSData? -> ()) {
            requestCount++
        }
    }
    
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
            container.register(Networking.self) { _ in MockNetwork() }
                .inObjectScope(.Container)
            container.register(WeatherFetcher.self) { r in
                WeatherFetcher(networking: r.resolve(Networking.self)!)
            }
            container.register(WeatherTablerViewController.self) { r in
                let controller = WeatherTablerViewController()
                controller.weatherFetcher = r.resolve(WeatherFetcher.self)
                return controller
            }
        }
        
        it("starts fetching weather information when the view is about appearing.") {
            let network = container.resolve(Networking.self) as! MockNetwork
            let controller = container.resolve(WeatherTablerViewController.self)!

            expect(network.requestCount) == 0
            controller.viewWillAppear(true)
            expect(network.requestCount).toEventually(equal(1))
        }
    }
}
