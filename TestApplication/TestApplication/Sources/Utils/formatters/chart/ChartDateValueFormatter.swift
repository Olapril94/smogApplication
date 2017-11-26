//
//  ChartDateValueFormatter.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import Charts

class ChartDateValueFormatter: NSObject, IAxisValueFormatter {
    private var dates: [Date]

    init(dates: [Date]) {
        self.dates = dates
    }

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        var index = Int(value)
        if index > dates.count {
            index = dates.count - 1
        }
        let date = dates[index]
        return ChartDateFormatter().string(from: date)
    }
}
