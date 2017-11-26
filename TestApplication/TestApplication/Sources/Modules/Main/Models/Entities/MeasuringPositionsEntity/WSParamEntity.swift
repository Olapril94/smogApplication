//
//  WSParamEntity.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import UIKit
import ObjectMapper

class WSParamEntity: Mappable {
    
    var paramName: String?
    var paramFormula: String?
    var paramCode: String?
    var idParam: Int?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.paramName       <- map["paramName"]
        self.paramFormula    <- map["paramFormula"]
        self.paramCode       <- map["paramCode"]
        self.idParam         <- map["idParam"]
    }
}
