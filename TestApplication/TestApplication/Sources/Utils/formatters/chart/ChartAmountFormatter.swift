//
//  ChartAmountValueFormatter.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import Charts

class ChartAmountValueFormatter: NSObject, IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if value == 0.0 {
            return "0"
        }

        return value.chartFormattedValue
    }
}
