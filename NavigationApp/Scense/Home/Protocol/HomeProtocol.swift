//
//  HomeProtocol.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import Mapbox

protocol HomeViewToPresenterProtocol: class {
    var view: PresenterToHomeViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    func getDataSuccess(_ lat: CLLocationDegrees,_ lng: CLLocationDegrees,_ radius: Int)
    func getDataFailed()
}

protocol PresenterToHomeViewProtocol: class {
    func showData(_ list: [NearByModel])
}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func getData(_ lat: CLLocationDegrees,_ lng: CLLocationDegrees,radius: Int)
}

protocol HomePresenterToRouterProtocol: class {
    static func createView() -> HomeViewController
}

protocol InteractorToPresenterProtocol: class {
    func DataSuccess(_ list: [NearByModel])
    func DataFailed(_ err: NSError)
}
