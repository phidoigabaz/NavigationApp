//
//  SearchDTO.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchDTO: NSObject {
    var id: String
    var type: String
    var place_type: String
    var relevance: Int
    var landmark: Bool
    var category: String
    var address: String
    var text: String
    var place_name: String
    var center: String
    var geometry: String
    var context: String
    
    init(_ json: JSON) {
        id = json["id"].stringValue
        type = json["type"].stringValue
        place_type = json["place_type"].stringValue
        relevance = json["relevance"].intValue
        landmark = json["landmark"].boolValue
        category = json["category"].stringValue
        address = json["address"].stringValue
        text = json["text"].stringValue
        place_name = json["place_name"].stringValue
        center = json["center"].stringValue
        geometry = json["geometry"].stringValue
        context = json["context"].stringValue
    }
}
