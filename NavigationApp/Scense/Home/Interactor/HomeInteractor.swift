//
//  HomeInteractor.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import Mapbox

class HomeInteractor: HomePresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    func getData(_ lat: CLLocationDegrees, _ lng: CLLocationDegrees, radius: Int) {
        let settingService = SettingService()
        settingService.cancelAllRequests()
        settingService.getNearBySearch(lat: lat, lng: lng, radius: 1500) { (model, err) in
            if err == nil {
                self.presenter?.DataSuccess(model)
            } else {
                if let error = err {
                    self.presenter?.DataFailed(error)
                }
            }
        }
    }
}
