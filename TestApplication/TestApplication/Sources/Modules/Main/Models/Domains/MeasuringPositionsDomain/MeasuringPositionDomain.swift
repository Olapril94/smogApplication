//
//  MeasuringPositionDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import UIKit

class MeasuringPositionDomain {
    
     // MARK: - Properties
    
    var id: Int!
    var stationId: Int!
    var param: ParamDomain?
    
    // MARK: - Initialization
    
    init(entity: WSMeasuringPositionsEntity) {
        self.id = entity.id
        self.stationId = entity.stationId
        self.param = ParamDomain(entity: entity.param!)
    }
}
