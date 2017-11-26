//
//  WSValueEntity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 24.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import ObjectMapper

class WSValueEntity: Mappable {

    // MARK: - Properties
    
    var date: String?
    var value: Double?

    required init?(map: Map) {
    }

    // MARK: - Mappable
    
    func mapping(map: Map) {
        date    <- map["date"]
        value   <- map["value"]
    }
}
