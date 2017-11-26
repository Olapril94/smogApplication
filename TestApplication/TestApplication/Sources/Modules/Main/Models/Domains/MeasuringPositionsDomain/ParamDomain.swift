//
//  ParamDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import UIKit

class ParamDomain {
    
     // MARK: - Properties
    
    var paramName: String!
    var paramFormula: String!
    var paramCode: String!
    var idParam: Int!
    
    // MARK: - Initialization
    
    init(entity: WSParamEntity) {
        self.paramName = entity.paramName
        self.paramFormula = entity.paramFormula
        self.paramCode = entity.paramCode
        self.idParam = entity.idParam
    }
}
