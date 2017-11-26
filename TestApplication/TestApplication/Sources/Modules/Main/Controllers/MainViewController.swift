//
//  MainViewController.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import PromiseKit
import Charts

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var chartView: MainLineChartView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pollutionButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Private properties
    
    fileprivate var httpClient = HTTPClient.shared
    fileprivate var measurePostitionDictionary = [(Int, String)]()
    fileprivate var stations: [StationListDomain]?
    fileprivate var pickedOption: Int?
    fileprivate let defaultCity = "Kraków"
    fileprivate let CITYLIST_SEGUE_ID = "cityListSegueId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupPicker()
        chartView.styleChart()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickerView.isHidden = true
        doneButton.isHidden = true
    }
    
    fileprivate func loadChart() {
        if let pickedOption = pickedOption {
            loadSensorData(sensorId: pickedOption)
            pickerView.isHidden = true
            doneButton.isHidden = true
        }
    }
    
    // MARK: - View setup
    
    func setupTitle() {
        self.title = "navigationbar.main.title".localized
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: ColorPalette.white]
    }
    
    private func setupPicker() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    fileprivate func setupPickerWithDefaults() {
        let valueSelected = measurePostitionDictionary.first!.0
        pickedOption = valueSelected
    }
    
    // MARK: - Actions

    @IBAction func showPickerWithPollutions(_ sender: Any) {
        pickerView.isHidden = false
        doneButton.isHidden = false
        self.pickerView.reloadAllComponents()
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        loadChart()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CITYLIST_SEGUE_ID {
            let navigationController = segue.destination as! UINavigationController
            let cityListController = navigationController.viewControllers.first as! CityListViewController
            
            cityListController.stationsList = stations!
                .filter { $0.city != nil }
                .sorted { $0.city!.name! < $1.city!.name! }
            cityListController.delegate = self
        }
    }
}

// MARK: - Handle webservice

extension MainViewController {
    func loadData() {
        firstly {
            loadListOfStations()
        }.then { id in
            self.loadSensors(stationId: id)
        }.then {
            self.setupDataOnView()
        }.always {
            self.setupPickerWithDefaults()
            self.loadChart()
        }.catch { _ in }
    }
    
    fileprivate func loadListOfStations() -> Promise<Int> {
        return Promise<Int> { fulfill, reject in
            httpClient
                .responseObjectCollection(router: MainRouter.stationList()) {
                    (responseEntity: [WSStationListEntity]?, responseError: ResponseError?) in
                    do {
                        if let error = responseError?.error {
                            reject(error)
                        }
                        
                        let listDomain = responseEntity!.map { StationListDomain(entity: $0) }
                        self.stations = listDomain
                        let stationId = listDomain
                            .filter { $0.city?.name == self.defaultCity }
                            .first!
                            .id!
                        
                        fulfill(stationId)
                    }
            }
        }
    }
    
    fileprivate func loadSensors(stationId: Int) -> Promise<Void> {
        return Promise<Void> { fulfill, _ in
            httpClient
                .responseObjectCollection(router: MainRouter.measuringPosition(stationId)) {
                    (responseEntity: [WSMeasuringPositionsEntity]?, error: ResponseError?) in
                    do {
                        if let entity = responseEntity {
                            let entity = entity
                            let measurePostitionDomain = entity.map {
                                MeasuringPositionDomain(entity: $0)
                            }
                            self.measurePostitionDictionary = self.getSensorsDictionary(measurePosition: measurePostitionDomain)
                            self.pickerView.reloadAllComponents()
                            fulfill()
                        }
                    }
            }
        }
    }
    
    fileprivate func loadSensorData(sensorId: Int) {
       httpClient
            .responseObject(router: MainRouter.measureData(sensorId)) {
                (responseEntity: WSMeasurmentDataEntity?, error: ResponseError?) in
                if let entity = responseEntity {
                    let domain = MeasurmentDataDomain(entity: entity)
                    if let valuesList = domain.values {
                        self.chartView.showChart(withMeasurmentData: valuesList)
                    }
                }
        }
    }
}

// MARK: - Picker methods

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return measurePostitionDictionary.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return measurePostitionDictionary[row].1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valueSelected = measurePostitionDictionary[row].0
        pickedOption = valueSelected
    }
    
    func getSensorsDictionary(measurePosition: [MeasuringPositionDomain]) -> [(Int, String)] {
        var dictionaryArray = [(id: Int, name: String)]()
        
        for pollution in measurePosition {
            dictionaryArray.append((pollution.id, (pollution.param?.paramFormula)!))
        }
        return dictionaryArray
    }
    
    func setupDataOnView() {
        cityNameLabel.text = stations?
            .filter { $0.city?.name == defaultCity }
            .first?
            .city?
            .name?
            .uppercased()
        
        stationNameLabel.text = stations?
            .filter { $0.city?.name == defaultCity }
            .first?
            .addressStreet
    }
}

// MARK: - Main view delegate

extension MainViewController: MainViewControllerDelegate {
    func setStationSelected(station: StationListDomain) {
        cityNameLabel.text = station.city?.name?.uppercased()
        stationNameLabel.text = station.addressStreet
        pickerView.selectRow(0, inComponent: 0, animated: false)
        
        firstly {
            self.loadSensors(stationId: station.id)
        }.always {
            let firstSensor = self.measurePostitionDictionary.first!
            self.loadSensorData(sensorId: firstSensor.0)
        }.catch {  _ in }
    }
}
