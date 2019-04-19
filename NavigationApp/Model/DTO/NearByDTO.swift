//
//  NearByDTO.swift
//  NavigationApp
//
//  Created by GEM on 4/18/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SwiftyJSON

class NearByDTO: NSObject {
    var id: String
    var type: String
    var place_type: String
    var relevance: Int
    var properties: String
    var text: String
    var place_name: String
    
    init(_ json: JSON) {
        id = json["id"].stringValue
        type = json["type"].stringValue
        place_type = json["place_type"].stringValue
        relevance = json["relevance"].intValue
        properties = json["propertites"].stringValue
        text = json["text"].stringValue
        place_name = json["place_name"].stringValue
    }
}


//GOOGLE MAP
//    var icon: String
//    var id: String
//    var name: String
//    var photos: String
//    var place_id: String
//    var reference: String
//    var scope: String
//    var type: String
//    var vicinity: String
//
//    init(_ json: JSON) {
//        icon = json["icon"].stringValue
//        id = json["id"].stringValue
//        name = json["name"].stringValue
//        photos = json["photos"].stringValue
//        place_id = json["place_id"].stringValue
//        reference = json["reference"].stringValue
//        scope = json["scope"].stringValue
//        type = json["type"].stringValue
//        vicinity = json["vicinity"].stringValue
//    }
