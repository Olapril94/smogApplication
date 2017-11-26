//
//  WSMeasurmentDataEntity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import ObjectMapper

class WSMeasurmentDataEntity: Mappable {

    // MARK: - Properties
    
    var key: String?
    var values: [WSValueEntity]?

    required init?(map: Map) {
    }

    // MARK: - Mappable
    
    func mapping(map: Map) {
        key    <- map["key"]
        values <- map["values"]
    }
}
