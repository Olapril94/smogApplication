
import Foundation
import ObjectMapper

class WSAirQualityIndexEntity: Mappable {

    // MARK: - Properties
    
    var id: Int?
    var stCalcDate: Date?
    var stIndexLevelEntity: WSIndexLevelEntity?
    var stSourceDataDate: Date?
    var so2CalcDate: Date?
    var so2IndexLevelEntity: WSIndexLevelEntity?
    var so2SourceDataDate: Date?
    var no2CalcDate: Date?
    var no2IndexLevelEntity: WSIndexLevelEntity?
    var no2SourceDataDate: Date?
    var coCalcDate: Date?
    var coIndexLevelEntity: WSIndexLevelEntity?
    var coSourceDataDate: Date?
    var pm10CalcDate: Date?
    var pm10IndexLevelEntity: WSIndexLevelEntity?
    var pm10SourceDataDate: Date?
    var pm25CalcDate: Date?
    var pm25IndexLevelEntity: WSIndexLevelEntity?
    var pm25SourceDataDate: Date?
    var o3CalcDate: Date?
    var o3IndexLevelEntity: WSIndexLevelEntity?
    var o3SourceDataDate: Date?
    var c6h6CalcDate: Date?
    var c6h6IndexLevelEntity: WSIndexLevelEntity?
    var c6h6SourceDataDate: Date?

    required init?(map: Map) {
    }

    // MARK: - Mappable
    
    func mapping(map: Map) {
        id                    <- map["id"]
        stCalcDate            <- (map["stCalcDate"], DateTransform())
        stIndexLevelEntity    <- map["stIndexLevelEntity"]
        stSourceDataDate      <- (map["stSourceDataDate"], DateTransform())
        so2CalcDate           <- (map["so2CalcDate"], DateTransform())
        so2IndexLevelEntity   <- map["so2IndexLevelEntity"]
        so2SourceDataDate     <- (map["so2SourceDataDate"], DateTransform())
        no2CalcDate           <- (map["no2CalcDate"], DateTransform())
        no2IndexLevelEntity   <- map["no2IndexLevelEntity"]
        no2SourceDataDate     <- (map["no2SourceDataDate"], DateTransform())
        coCalcDate            <- (map["coCalcDate"], DateTransform())
        coIndexLevelEntity    <- map["coIndexLevelEntity"]
        coSourceDataDate      <- (map["coSourceDataDate"], DateTransform())
        pm10CalcDate          <- (map["pm10CalcDate"], DateTransform())
        pm10IndexLevelEntity  <- map["pm10IndexLevelEntity"]
        pm10SourceDataDate    <- (map["pm10SourceDataDate"], DateTransform())
        pm25CalcDate          <- (map["pm25CalcDate"], DateTransform())
        pm25IndexLevelEntity  <- map["pm25IndexLevelEntity"]
        pm25SourceDataDate    <- (map["pm25SourceDataDate"], DateTransform())
        o3CalcDate            <- (map["o3CalcDate"], DateTransform())
        o3IndexLevelEntity    <- map["o3IndexLevelEntity"]
        o3SourceDataDate      <- (map["o3SourceDataDate"], DateTransform())
        c6h6CalcDate          <- (map["c6h6CalcDate"], DateTransform())
        c6h6IndexLevelEntity  <- map["c6h6IndexLevelEntity"]
        c6h6SourceDataDate    <- (map["c6h6SourceDataDate"], DateTransform())
    }
}
