//
//  Networking.swift
//  SwinjectSimpleExample
//
//  Created by Yoichi Tagaya on 8/10/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Foundation

protocol Networking {
    func request(_ response: @escaping (Data?) -> ())
}
