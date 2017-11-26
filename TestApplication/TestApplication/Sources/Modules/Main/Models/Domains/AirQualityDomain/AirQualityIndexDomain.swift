//
//  AirQualityIndexDomain.swift
//  TestApplication
//
//  Created by Aleksandra Kwiecien on 25.11.2017.
//  Copyright © 2017 Aleksandra Kwiecien. All rights reserved.
//

import Foundation
import ObjectMapper

class AirQualityIndexDomain {

    // MARK: - Properties
    
    var id: Int?
    var stCalcDate: Date?
    var stIndexLevelDomain: IndexLevelDomain?
    var stSourceDataDate: Date?
    var so2CalcDate: Date?
    var so2IndexLevelDomain: IndexLevelDomain?
    var so2SourceDataDate: Date?
    var no2CalcDate: Date?
    var no2IndexLevelDomain: IndexLevelDomain?
    var no2SourceDataDate: Date?
    var coCalcDate: Date?
    var coIndexLevelDomain: IndexLevelDomain?
    var coSourceDataDate: Date?
    var pm10CalcDate: Date?
    var pm10IndexLevelDomain: IndexLevelDomain?
    var pm10SourceDataDate: Date?
    var pm25CalcDate: Date?
    var pm25IndexLevelDomain: IndexLevelDomain?
    var pm25SourceDataDate: Date?
    var o3CalcDate: Date?
    var o3IndexLevelDomain: IndexLevelDomain?
    var o3SourceDataDate: Date?
    var c6h6CalcDate: Date?
    var c6h6IndexLevelDomain: IndexLevelDomain?
    var c6h6SourceDataDate: Date?

    // MARK: - Initialization
    
    init(entity: WSAirQualityIndexEntity) {
      self.id = entity.id

      self.stCalcDate = entity.stCalcDate
      if let stIndexLevelEntity = entity.stIndexLevelEntity {
        self.stIndexLevelDomain = IndexLevelDomain(entity: stIndexLevelEntity)
      }
      self.stSourceDataDate = entity.stSourceDataDate

      self.so2CalcDate = entity.so2CalcDate
      if let so2IndexLevelEntity = entity.so2IndexLevelEntity {
        self.so2IndexLevelDomain = IndexLevelDomain(entity: so2IndexLevelEntity)
      }
      self.so2SourceDataDate = entity.so2SourceDataDate

      self.no2CalcDate = entity.no2CalcDate
      if let no2IndexLevelEntity = entity.no2IndexLevelEntity {
        self.no2IndexLevelDomain = IndexLevelDomain(entity: no2IndexLevelEntity)
      }

      self.no2SourceDataDate = entity.no2SourceDataDate

      self.coCalcDate = entity.coCalcDate
      if let coIndexLevelEntity = entity.coIndexLevelEntity {
      self.coIndexLevelDomain = IndexLevelDomain(entity: coIndexLevelEntity)
      }
      self.coSourceDataDate = entity.coSourceDataDate

      self.pm10CalcDate = entity.pm10CalcDate
      if let pm10IndexLevelEntity = entity.pm10IndexLevelEntity {
        self.pm10IndexLevelDomain = IndexLevelDomain(entity: pm10IndexLevelEntity)
      }
      self.pm10SourceDataDate = entity.pm10SourceDataDate

      self.pm25CalcDate = entity.pm25CalcDate
      if let pm25IndexLevelEntity = entity.pm25IndexLevelEntity {
        self.pm25IndexLevelDomain = IndexLevelDomain(entity: pm25IndexLevelEntity)
      }
      self.pm25SourceDataDate = entity.pm25SourceDataDate

      self.o3CalcDate = entity.o3CalcDate
      if let o3IndexLevelEntity = entity.o3IndexLevelEntity {
        self.o3IndexLevelDomain = IndexLevelDomain(entity: o3IndexLevelEntity)
      }
      self.o3SourceDataDate = entity.o3SourceDataDate

      self.c6h6CalcDate = entity.c6h6CalcDate
      if let c6h6IndexLevelEntity = entity.c6h6IndexLevelEntity {
        self.c6h6IndexLevelDomain = IndexLevelDomain(entity: c6h6IndexLevelEntity)
      }
      self.c6h6SourceDataDate = entity.c6h6SourceDataDate
    }
}
