//
//  WSCityEntity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import ObjectMapper

class WSCityEntity: Mappable {
    
    var id: Int?
    var name: String?
    var commune: [WSCommuneEntity]?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id             <- map["id"]
        self.name           <- map["name"]
        self.commune        <- map["commune"]
    }
}
