//
//  WSMeasuringPositionsEnitity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import ObjectMapper

class WSMeasuringPositionsEntity: Mappable {
    
    var id: Int?
    var stationId: Int?
    var param: WSParamEntity?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id             <- map["id"]
        self.stationId      <- map["stationId"]
        self.param          <- map["param"]
    }
}

