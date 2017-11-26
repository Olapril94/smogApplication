//
//  LineChartWithShadowRenderer.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import Charts

class LineChartWithShadowRenderer: LineChartRenderer {

    // MARK: - Private constants
    
    private let shadow = UIColor.black
    private let shadowOffset = CGSize(width: 3.1, height: 3.1)
    private let shadowBlurRadius: CGFloat = 5
    
    // MARK: - Drawer

    override func drawLinear(context: CGContext, dataSet: ILineChartDataSet) {
        context.saveGState()
        context.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadow.cgColor)
        context.setAllowsAntialiasing(true)
        super.drawLinear(context: context, dataSet: dataSet)
        context.restoreGState()
    }
}
