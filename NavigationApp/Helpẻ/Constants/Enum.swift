//
//  Enum.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

enum Types: String {
    case lodging = "lodging"
    case university = "university"
    case shopping_mall = "Shopping_mall"
    case spa = "spa"
    case store = "store"
    case restaurant = "restaurant"
    case cafe = "cafe"
    case bar = "bar"
    case template = "template"
    case hospital = "hospital"
    case movie_theater = "movie_theater"
    case school = "school"
    case unknow = "unknow"
    
    func getTypeString() -> String {
        switch self {
        case .lodging:
            return "lodging"
        case .university:
            return "university"
        case .shopping_mall:
            return "shopping_mall"
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
        case .university:
            return nil
        case .shopping_mall:
            return UIImage(named: "shopping-mall")
        case .spa:
            return nil
        case .store:
            return UIImage(named: "shopping-mall")
        case .restaurant:
            return UIImage(named: "restaurant")
        case .cafe:
            return UIImage(named: "cafe")
        case .bar:
            return nil
        case .template:
            return UIImage(named: "template")
        default:
            return nil
        }
    }
}
