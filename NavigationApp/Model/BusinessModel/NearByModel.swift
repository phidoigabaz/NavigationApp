//
//  NearByModel.swift
//  NavigationApp
//
//  Created by GEM on 4/18/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class NearByModel: NSObject {
    
    var id: String
    var type: String
    var place_type: String
    var relevance: Int
    var properties: String
    var text: String
    var place_name: String
    
    init(_ dto: NearByDTO) {
        id = dto.id
        type = dto.type
        place_type = dto.place_type
        relevance = dto.relevance
        properties = dto.properties
        text = dto.text
        place_name = dto.place_name
    }
}

//GOOGLE MAP
//var icon: String
//var id: String
//var name: String
//var photos: String
//var place_id: String
//var reference: String
//var scope: String
//var type: String
//var vicinity: String
//
//init(_ dto: NearByDTO) {
//    icon = dto.icon
//    id = dto.id
//    name = dto.name
//    photos = dto.photos
//    place_id = dto.place_id
//    reference = dto.reference
//    scope = dto.scope
//    type = dto.type
//    vicinity = dto.vicinity
//}
