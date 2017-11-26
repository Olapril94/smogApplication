//
//  IndexLevelDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

class IndexLevelDomain {

    // MARK: - Properties
    
    let id: Int!
    let indexLevelName: String!

    // MARK: - Initialization
    
    init(entity: WSIndexLevelEntity) {
      self.id = entity.id
      self.indexLevelName = entity.indexLevelName
    }
}
