//
//  MainRouter.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

enum MainRouter: URLRequestConvertible {
    
    // MARK: - Base Url
    
    static let baseURLString = TargetConfig.baseURLString
    
    // MARK: - Router url setup
    
    case measuringPosition(Int)
    case stationList()
    case measureData(Int)
    case airQuality(Int)
    
    
    var method: HTTPMethod {
        switch self {
        case .measuringPosition, .stationList, .measureData, .airQuality:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .measuringPosition(let id):
            return "/station/sensors/\(id)"
        case .stationList():
            return "/station/findAll"
        case .measureData(let id):
            return  "/data/getData/\(id)"
        case .airQuality(let id):
            return  "/aqindex/getIndex/\(id)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try MainRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        print(urlRequest)
        
        return urlRequest
    }
}
