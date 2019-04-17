//
//  LocationManager.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Mapbox

class LocationManager: NSObject {
    
    // MARK: - Singleton
    static let shared = LocationManager()
    var userLocation: MGLUserLocation?
}
