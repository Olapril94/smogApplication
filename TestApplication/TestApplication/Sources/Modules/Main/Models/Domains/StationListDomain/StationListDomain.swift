//
//  StationListDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 24.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit

class StationListDomain {
    
     // MARK: - Properties
    
    var id: Int!
    var stationName: String!
    var dateStart: String!
    var dateEnd: String?
    var gegrLat: String!
    var gegrLon: String!
    var city: WSCityEntity?
    var addressStreet: String?
    
    // MARK: - Initialization
    
    init(entity: WSStationListEntity) {
        self.id = entity.id
        self.stationName = entity.stationName
        self.dateStart = entity.dateStart
        self.dateEnd = entity.dateEnd ?? "-"
        self.gegrLat = entity.gegrLat
        self.gegrLon = entity.gegrLon
        self.city = entity.city
        self.addressStreet = entity.addressStreet ?? ""
    }
}
