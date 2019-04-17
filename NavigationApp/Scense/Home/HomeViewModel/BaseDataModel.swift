//
//  BaseDataModel.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class BaseDataModel: NSObject {
    var sections = [BaseViewModel]()
    
    func parseData() {
        sections.removeAll()
        sections.append(BaseViewModel("Saved places", UIImage(named: "valentines-heart")))
        sections.append(BaseViewModel("Work", UIImage(named: "work")))
        sections.append(BaseViewModel("Home", UIImage(named: "home-button")))
        sections.append(BaseViewModel("Plan", UIImage(named: "plan")))
    }
}
