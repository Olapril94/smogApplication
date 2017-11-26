//
//  CityDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit

class CityDomain {
    
    // MARK: - Properties
    
    var id: Int!
    var name: String!
    var commune = [CommuneDomain]()
    
    // MARK: - Initialization
    
    init(entity: WSCityEntity) {
        self.id = entity.id
        self.name = entity.name
        self.commune =  entity.commune?.map({CommuneDomain(entity: $0)}) ?? []
    }
}
