//
//  PhotosModel.swift
//  NavigationApp
//
//  Created by GEM on 4/23/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class PhotosModel: NSObject {
    var height: Float
    var html_attributions: String
    var photo_reference: String
    var width: Float
    
    init(_ dto: PhotosDTO) {
        height = dto.height
        html_attributions = dto.html_attributions
        photo_reference = dto.photo_reference
        width = dto.width
    }
}
