//
//  SwinjectStoryboard+Setup.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 11/20/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.storyboardInitCompleted(WeatherTableViewController.self) { r, c in
            c.weatherFetcher = r.resolve(WeatherFetcher.self)
        }
        defaultContainer.register(Networking.self) { _ in Network() }
        defaultContainer.register(WeatherFetcher.self) { r in
            WeatherFetcher(networking: r.resolve(Networking.self)!)
        }
    }
}
