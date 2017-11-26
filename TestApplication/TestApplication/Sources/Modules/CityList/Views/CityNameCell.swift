//
//  CityNameCell.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 26.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import UIKit

class CityNameCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityStreetLabel: UILabel!
    
    // MARK: - Setup
    
    func configure(domain: StationListDomain) {
        cityNameLabel.text = domain.city?.name ?? ""
        cityStreetLabel.text = domain.addressStreet ?? ""
    }
}
