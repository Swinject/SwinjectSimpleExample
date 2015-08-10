//
//  WeatherFetcherSpec.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright (c) 2015 Swinject Contributors. All rights reserved.
//


import Quick
import Nimble
import Swinject
@testable import SwinjectSimpleExample

class WeatherFetcherSpec: QuickSpec {
    struct StubNetwork: Networking {    
        private static let json =
        "{" +
            "\"list\": [" +
                "{" +
                    "\"id\": 2643743," +
                    "\"name\": \"London\"," +
                    "\"weather\": [" +
                        "{" +
                            "\"main\": \"Rain\"" +
                        "}" +
                    "]" +
                "}," +
                "{" +
                    "\"id\": 3451190," +
                    "\"name\": \"Rio de Janeiro\"," +
                    "\"weather\": [" +
                        "{" +
                            "\"main\": \"Clear\"" +
                        "}" +
                    "]" +
                "}" +
            "]" +
        "}"
        
        func request(response: NSData? -> ()) {
            let data = StubNetwork.json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            response(data)
        }
    }
    
    override func spec() {
        let container = Container()
        container.register(Networking.self) { _ in Network() }
        container.register(WeatherFetcher.self) { r in
            WeatherFetcher(networking: r.resolve(Networking.self)!)
        }
        container.register(Networking.self, name: "stub") { _ in StubNetwork() }
        container.register(WeatherFetcher.self, name: "stub") { r in
            WeatherFetcher(networking: r.resolve(Networking.self, name: "stub")!)
        }
        
        it("returns cities.") {
            var cities: [City]?
            let fetcher = container.resolve(WeatherFetcher.self)!
            fetcher.fetch { cities = $0 }
            
            expect(cities).toEventuallyNot(beNil())
            expect(cities?.count).toEventually(beGreaterThan(0))
        }
        it("fills weather data.") {
            var cities: [City]?
            let fetcher = container.resolve(WeatherFetcher.self, name: "stub")!
            fetcher.fetch { cities = $0 }
            
            expect(cities?[0].id).toEventually(equal(2643743))
            expect(cities?[0].name).toEventually(equal("London"))
            expect(cities?[0].weather).toEventually(equal("Rain"))
            expect(cities?[1].id).toEventually(equal(3451190))
            expect(cities?[1].name).toEventually(equal("Rio de Janeiro"))
            expect(cities?[1].weather).toEventually(equal("Clear"))
        }
    }
}
