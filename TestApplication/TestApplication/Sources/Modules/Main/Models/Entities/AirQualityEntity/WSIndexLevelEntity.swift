
import Foundation
import ObjectMapper

class WSIndexLevelEntity: Mappable {

    // MARK: - Properties
    
    var id: Int?
    var indexLevelName: String?

    required init?(map: Map) {
    }

    // MARK: - Mappable
    
    func mapping(map: Map) {
        id               <- map["id"]
        indexLevelName   <- map["indexLevelName"]
    }
}
