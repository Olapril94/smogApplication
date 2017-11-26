//
//  MeasurmentDataDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

class MeasurmentDataDomain {

    // MARK: - Properties

    var key: String!
    var values: [ValueDomain]?

    // MARK: - Initialization

    init(entity: WSMeasurmentDataEntity) {
        self.key = entity.key
        if let values = entity.values {
            self.values = values.map {
                ValueDomain(entity: $0)
            }
        }
    }
}
