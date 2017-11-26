//
//  ChartDateFormatter.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

class ChartDateFormatter: DateFormatter {
    override init() {
        super.init()
        setDefaultFormat()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDefaultFormat()
    }

    fileprivate func setDefaultFormat() {
        let tz = TimeZone(abbreviation: "UTC")
        self.timeZone = tz
        self.locale = Locale.init(identifier: "en_US_POSIX")
        self.dateFormat = "dd/MM"
    }
}
