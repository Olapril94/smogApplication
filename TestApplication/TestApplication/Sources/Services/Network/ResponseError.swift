//
//  ResponseError.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit

class ResponseError {
    
    var httpCode: Int
    var localizedDescription: String = ""
    var json: AnyObject?
    
    init(httpCode: Int, error: Error) {
        self.httpCode = httpCode
        self.localizedDescription = error.localizedDescription
    }
    
    init(httpCode: Int, json: AnyObject) {
        self.httpCode = httpCode
        self.json = json
    }
}
