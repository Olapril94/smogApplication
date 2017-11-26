//
//  Double.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

extension Double {
    var chartFormattedValue: String {
        let formattedValue = ceil(self)
        let result = "\(Int(formattedValue))"
        return result
    }
}
