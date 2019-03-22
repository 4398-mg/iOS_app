

import SwiftyJSON

class responseObject {
    var response: String!
    
    
    
    required init(json: JSON){
        response = json["endpoints"].stringValue
    }
}
