//
//  JsonStringEncoding.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import Alamofire

struct JsonStringEncoding: ParameterEncoding {
    private let jsonString: String
    
    init(jsonString: String) {
        self.jsonString = jsonString
    }
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = urlRequest.urlRequest
        
        if urlRequest!.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest!.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        urlRequest!.httpBody = jsonString.data(using: .utf8)
        
        return urlRequest!
    }
}
