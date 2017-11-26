//
//  CityListViewController.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 26.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import UIKit

class CityListViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Public properties

    var stationsList = [StationListDomain]()
    var searchList = [StationListDomain]()
    
    weak var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBarSearch()
        
        searchBar.delegate = self
        
        searchList = stationsList
    }
    
    // MARK: - Setup
    
    func setupView() {
        self.title = "navigationbar.citylist.title".localized
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: ColorPalette.white]
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 40.0
        tableView.allowsSelection = true
        tableView.tableFooterView = UIView()

        tableView.register(UINib(nibName: String(describing: CityNameCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CityNameCell.self))
    }
    
    func setupBarSearch() {
        searchBar.barTintColor = ColorPalette.blueColor
    }
    
    // MARK: - Actions
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Table view delegate and dataSource

extension CityListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityNameCell.self), for: indexPath) as! CityNameCell
        let item = searchList[indexPath.row]
        cell.configure(domain: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = searchList[indexPath.row]
        
        self.dismiss(animated: true, completion: { [weak self] _ in
            self?.delegate?.setStationSelected(station: item)
        })
    }
}

// MARK: - Searchbar delegate

extension CityListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            searchList = stationsList.filter({ (text) in
                let stringMatch = text.city?.name?.lowercased().range(of: searchText.lowercased())
                return stringMatch != nil
            })
        } else {
            searchList = stationsList
        }
        tableView.reloadData()
    }
}
