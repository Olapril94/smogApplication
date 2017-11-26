//
//  MainLineChartView.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import Charts

class MainLineChartView: LineChartView {

    // MARK: - Private constants

    private let lineWidth: CGFloat = 3.0
    private let leftAxisLabelsCount = 5
    private let xAxisLabelCount = 3
    private let emptyValue: Double = 1000
    private let animationTime = 2.0

    // MARK: - Chart styling

    func styleChart() {
        renderer = LineChartWithShadowRenderer(dataProvider: self,
                                               animator: self.chartAnimator,
                                               viewPortHandler: self.viewPortHandler)
        drawBordersEnabled = false
        legend.enabled = false
        pinchZoomEnabled = false
        chartDescription?.enabled = false
        isUserInteractionEnabled = false
        drawMarkers = false
        marker = nil
        noDataText = ""
        styleXAxis()
        styleLeftAxis()
        styleRightAxis()
        minOffset = 15
    }

    private func styleXAxis() {
        xAxis.drawLabelsEnabled = true
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        xAxis.labelTextColor = UIColor.black
        xAxis.avoidFirstLastClippingEnabled = true
    }

    private func styleLeftAxis() {
        leftAxis.yOffset = 0
        leftAxis.xOffset = 2
        leftAxis.drawAxisLineEnabled = false
        leftAxis.gridLineDashLengths = [2]
        leftAxis.removeAllLimitLines()
        leftAxis.drawZeroLineEnabled = true
        leftAxis.gridLineDashPhase = 0
        leftAxis.labelPosition = .outsideChart
        leftAxis.valueFormatter = ChartAmountValueFormatter()
    }

    private func styleRightAxis() {
        rightAxis.enabled = false
        rightAxis.drawAxisLineEnabled = false
        rightAxis.drawLabelsEnabled = false
    }

    private func stylePositiveDataSet(_ dataSet: LineChartDataSet) {
        styleDataSet(dataSet)
        dataSet.setColor(ColorPalette.blueColor)
    }

    private func styleNegativeDataSet(_ dataSet: LineChartDataSet) {
        styleDataSet(dataSet)
        dataSet.setColor(ColorPalette.blueColor)
    }

    private func styleDataSet(_ dataSet: LineChartDataSet) {
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.lineWidth = lineWidth
        dataSet.lineCapType = .round
    }

    func showChart(withMeasurmentData data: [ValueDomain]) {
        if data.isEmpty {
            return
        }

        let dates = data
            .flatMap { $0.date }
            .sorted()

        xAxis.valueFormatter = ChartDateValueFormatter(dates: dates)

        var dataSets = [LineChartDataSet]()
        var dataEntries = [ChartDataEntry]()

        for (i, valueData) in data.enumerated() {
            if let value = valueData.value {
                dataEntries.append(ChartDataEntry(x: Double(i), y: value))
            }
        }
        
        let lineDataSet = createDataSet(dataEntries: dataEntries)
        dataSets.append(lineDataSet)

        self.data = LineChartData(dataSets: dataSets)
        animate(xAxisDuration: 0, yAxisDuration: animationTime, easingOption: .easeInOutCubic)
    }

    private func createDataSet(dataEntries: [ChartDataEntry]) -> LineChartDataSet {
        let lineDataSet = LineChartDataSet(values: dataEntries, label: nil)
        stylePositiveDataSet(lineDataSet)
        return lineDataSet
    }
}
