//
//  WSStationListEntity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 24.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit
import ObjectMapper

class WSStationListEntity: Mappable {
    
    var id: Int?
    var stationName: String?
    var dateStart: String?
    var dateEnd: String?
    var gegrLat: String?
    var gegrLon: String?
    var city: WSCityEntity?
    var addressStreet: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id             <- map["id"]
        self.stationName    <- map["stationName"]
        self.dateStart      <- map["dateStart"]
        self.dateEnd        <- map["dateEnd"]
        self.gegrLat        <- map["gegrLat"]
        self.gegrLon        <- map["gegrLon"]
        self.city           <- map["city"]
        self.addressStreet  <- map["addressStreet"]
    }
}
