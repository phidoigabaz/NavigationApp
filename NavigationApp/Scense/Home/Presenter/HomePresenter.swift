//
//  HomePresenter.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    var view: PresenterToHomeViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
}

