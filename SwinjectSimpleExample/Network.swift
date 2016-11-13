//
//  Network.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Foundation
import Alamofire

struct Network : Networking {
    func request(_ networkResponse: @escaping (Data?) -> ()) {
        Alamofire.request(OpenWeatherMap.url, parameters: OpenWeatherMap.parameters).responseData { (dataResponse) in
            networkResponse(dataResponse.data)
        }
    }
}
