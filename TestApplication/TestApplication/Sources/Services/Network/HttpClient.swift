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
    
    fileprivate let serverUrl = TargetConfig.baseURLString
    fileprivate var manager: Alamofire.SessionManager!
    
    private override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    fileprivate func showNetworkActivityIndicator(visible: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = visible
    }
}

//MARK: - Communication

extension HTTPClient {
    func request(url: String, parameters: Parameters, body: String? = nil, method: HTTPMethod,
                 completion: @escaping (_ json: String?, _ error: ResponseError?, _ httpCode: Int) -> Void) {
        let prefixedUrl = url
        var encoding: ParameterEncoding = URLEncoding.default
        
        if body != nil {
            encoding = JsonStringEncoding(jsonString: body!)
        }
        
        _ = manager.request(serverUrl + prefixedUrl, method: method, parameters: parameters,
                                      encoding: encoding).responseData { response in
                                        let httpCode = response.response?.statusCode ?? 0
                                        
                                        switch response.result {
                                        case .success(_):
                                            if let data = response.result.value {
                                                let convertedData = String(data: data, encoding: .utf8)
                                                if (200 ... 299).contains(httpCode) {
                                                    completion(convertedData, nil, httpCode)
                                                }
                                            }
                                        case .failure(let error):
                                            DispatchQueue.main.async {
                                                let responseError = ResponseError(httpCode: httpCode, error: error)
                                                completion(nil, responseError, httpCode)
                                            }
                                        }
                                        
        }
    }
}
