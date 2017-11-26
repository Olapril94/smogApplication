//
//  ValueDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 24.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

class ValueDomain {

    // MARK: - Properties

    var date: Date!
    var value: Double!

    // MARK: - Initialization

    init(entity: WSValueEntity) {
        self.date = SimpleDateFormatter().date(from: entity.date!)
        self.value = entity.value
    }
}
