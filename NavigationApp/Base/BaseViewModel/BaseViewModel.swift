//
//  HomeViewModel.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

class BaseViewModel: PBaseRowModel {
    var title: String
    var desc: String?
    var identifier: String
    var image: UIImage?
    
    init(_ title: String,_ desc: String?,_ identifier: String,_ image: UIImage?) {
        self.title = title
        self.desc = desc
        self.identifier = identifier
        self.image = image
    }
}
