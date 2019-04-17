//
//  SearchModel.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit


class SearchModel: NSObject {
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
    
    init(_ dto: SearchDTO) {
        id = dto.id
        type = dto.type
        place_type = dto.place_type
        relevance = dto.relevance
        landmark = dto.landmark
        category = dto.category
        address = dto.address
        text = dto.text
        place_name = dto.place_name
        center = dto.center
        geometry = dto.geometry
        context = dto.context
    }
}
