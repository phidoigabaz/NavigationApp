//
//  HomePresenter.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import Mapbox

class HomePresenter: HomeViewToPresenterProtocol {
    var view: PresenterToHomeViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    func getDataSuccess(_ lat: CLLocationDegrees,_ lng: CLLocationDegrees,_ radius: Int) {
        interactor?.getData(lat, lng, radius: radius)
    }
    
    func getDataFailed() {
        
    }
}


extension HomePresenter: InteractorToPresenterProtocol {
    func DataSuccess(_ list: [NearByModel]) {
        view?.showData(list)
    }
    
    func DataFailed(_ err: NSError) {
        
    }
}
