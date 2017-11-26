//
//  MainViewControllerDelegate.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 26.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation

protocol MainViewControllerDelegate: class {
    func setStationSelected(station: StationListDomain)
}
