//
//  WSCommuneEntity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import ObjectMapper

class WSCommuneEntity: Mappable {
    
    var communeName: String?
    var districtName: String?
    var provinceName: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.communeName       <- map["communeName"]
        self.districtName      <- map["districtName"]
        self.provinceName      <- map["provinceName"]
    }
}
