//
//  WeatherFetcherSpec.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright (c) 2015 Swinject Contributors. All rights reserved.
//


import Quick
import Nimble
@testable import SwinjectSimpleExample

class WeatherFetcherSpec: QuickSpec {
    override func spec() {
        it("returns cities.") {
            var cities: [City]?
            let fetcher = WeatherFetcher(networking: Network())
            fetcher.fetch { cities = $0 }
            
            expect(cities).toEventuallyNot(beNil())
            expect(cities?.count).toEventually(equal(12))
            expect(cities?[0].id).toEventually(equal(6077243))
            expect(cities?[0].name).toEventually(equal("Montreal"))
            expect(cities?[0].weather).toEventually(equal("Clouds"))
        }
    }
}
