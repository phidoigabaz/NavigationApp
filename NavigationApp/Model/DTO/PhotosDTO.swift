//
//  PhotosDTO.swift
//  NavigationApp
//
//  Created by GEM on 4/23/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotosDTO: NSObject {
    var height: Float
    var html_attributions: String
    var photo_reference: String
    var width: Float
    
    init(_ json: JSON) {
        height = json["height"].floatValue
        html_attributions = json["html_attributions"].stringValue
        photo_reference = json["photo_reference"].stringValue
        width = json["width"].floatValue
    }
}
