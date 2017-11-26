//
//  CommuneDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit

class CommuneDomain {
    
     // MARK: - Properties
    
    var communeName: String!
    var districtName: String!
    var provinceName: String!
    
    // MARK: - Initialization
    
    init(entity: WSCommuneEntity) {
        self.communeName = entity.communeName
        self.districtName = entity.districtName
        self.provinceName = entity.provinceName
    }
}
