//
//  String.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

public extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
