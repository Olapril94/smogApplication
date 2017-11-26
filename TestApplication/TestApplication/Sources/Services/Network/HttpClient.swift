//
//  HttpClient.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class HTTPClient: NSObject {
    
    // MARK: - Private attributes
    
    static let shared = HTTPClient()
    
    var manager: Alamofire.SessionManager!
    
    private override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
}

// MARK: - Communication

extension HTTPClient {
    
    func responseObjectCollection<E: Mappable>(router: URLRequestConvertible, completion: @escaping (_ entity: [E]?, _ error: ResponseError?) -> Void) {
        let request = self.manager!.request(router)
        let queue = DispatchQueue(label: "get", attributes: .concurrent)
        
        request.response(
            queue: queue,
            responseSerializer: DataRequest.jsonResponseSerializer(options: .allowFragments),
            completionHandler: { response in
    
                var httpCode = 0
                if let code = response.response?.statusCode {
                    httpCode = code
                }
                switch response.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        if let responseObject = Mapper<E>().mapArray(JSONObject: value), (200 ... 299).contains(httpCode) {
                            completion(responseObject, nil)
                        } else {
                            let responseError = ResponseError(httpCode: httpCode, json: value as AnyObject)
                            completion(nil, responseError)
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        let responseError = ResponseError(httpCode: httpCode, error: error)
                        completion(nil, responseError)
                    }
                }
        })
    }
    
    func responseObject<E: Mappable>(router: URLRequestConvertible, completion: @escaping (_ entity: E?, _ error: ResponseError?) -> Void) {
    
        let request = self.manager!.request(router)
        let queue = DispatchQueue(label: "get", attributes: .concurrent)
        
        request.response(
            queue: queue,
            responseSerializer: DataRequest.jsonResponseSerializer(options: .allowFragments),
            completionHandler: { response in
                var httpCode = 0
                if let code = response.response?.statusCode {
                    httpCode = code
                }
                switch response.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        if let responseObject = Mapper<E>().map(JSONObject: value), (200 ... 299).contains(httpCode) {
                            completion(responseObject, nil)
                        } else {
                            let responseError = ResponseError(httpCode: httpCode, json: value as AnyObject)
                            completion(nil, responseError)
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        let responseError = ResponseError(httpCode: httpCode, error: error)
                        completion(nil, responseError)
                    }
                }
        })
    }
}
