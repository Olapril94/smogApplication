//
//  TargetConfig.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 24.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit

struct TargetConfig {
    
    // MARK: - HTTP Config
    
    static let baseURLString: String = "http://api.gios.gov.pl/pjp-api/rest"
   
    static let timeoutIntervalForRequest: Double = 360
    static let timeoutIntervalForResource: Double = 360
}
