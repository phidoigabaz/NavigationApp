//
//  Constants.swift
//  PamZ
//
//  Created by admin on 10/29/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let MAPBOX_ACESS_TOKEN = "pk.eyJ1IjoicGhpZG9pZ2FiYXoiLCJhIjoiY2p1ZGhmbXo0MGVseDRlcjF3bG1ndWZ3OCJ9.HYgvGCXqshnQKi4lW8xfkQ"
    static let latDefault = ""
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let isIpad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    static let iPhone = "iPhone"
    static let iPad = "iPad"
    static let iWidth = UIScreen.main.bounds.width
    static let iHeight = UIScreen.main.bounds.height
    
    static let cardWidth: CGFloat = 122
    
    static let kUserDefault = "kUserdefault"
}

//C8C9CB -> search
