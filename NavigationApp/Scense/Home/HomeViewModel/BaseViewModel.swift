//
//  HomeViewModel.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

class BaseViewModel: NSObject {
    var title: String
    var image: UIImage?
    
    init(_ title: String,_ image: UIImage?) {
        self.title = title
        self.image = image
    }
}
