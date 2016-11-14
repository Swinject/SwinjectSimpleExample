//
//  WeatherFetcher.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherFetcher {
    let networking: Networking
    
    func fetch(_ response: @escaping ([City]?) -> ()) {
        networking.request { data in
            let cities = data.map { self.decode($0 as Data) }
            response(cities)
        }
    }
    
    fileprivate func decode(_ data: Data) -> [City] {
        let json = JSON(data: data)
        var cities = [City]()
        for (_, j) in json["list"] {
            if let id = j["id"].int {
                cities.append(City(id: id, name: j["name"].string ?? "", weather: j["weather"][0]["main"].string ?? ""))
            }
        }
        return cities
    }
}
