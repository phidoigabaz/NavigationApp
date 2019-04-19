//
//  Enum.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

enum Types {
    case lodging
    case general_contractor
    case university
    case shopping_mall
    case spa
    case store
    case restaurant
    case cafe
    case bar
    case template
    case unknow
    
    func getTypeString() -> String {
        switch self {
        case .lodging:
            return "lodging"
        case .general_contractor:
            return "general_contractor"
        case .university:
            return "university"
        case .shopping_mall:
            return "university"
        case .spa:
            return "spa"
        case .store:
            return "store"
        case .restaurant:
            return "restaurant"
        case .cafe:
            return "cafe"
        case .bar:
            return "bar"
        case .template:
            return "template"
        default:
            return "unknow"
        }
    }
    
    func getTypeImage() -> UIImage? {
        switch self {
        case .lodging:
            return nil
        case .general_contractor:
            return nil
        case .university:
            return nil
        case .shopping_mall:
            return UIImage(named: "shopping-bag")
        case .spa:
            return nil
        case .store:
            return UIImage(named: "shopping-bag")
        case .restaurant:
            return UIImage(named: "restaurant")
        case .cafe:
            return UIImage(named: "coffee")
        case .bar:
            return nil
        case .template:
            return UIImage(named: "template")
        default:
            return nil
        }
    }
}
