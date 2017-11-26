//
//  SimpleDateFormatter.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

class SimpleDateFormatter: DateFormatter {
    override init() {
        super.init()
        setDefaultFormat()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDefaultFormat()
    }

    private func setDefaultFormat() {
        let tz = TimeZone.autoupdatingCurrent
        self.timeZone = tz
        self.dateFormat = "yyyy-MM-dd hh:mm:ss"
    }
}
