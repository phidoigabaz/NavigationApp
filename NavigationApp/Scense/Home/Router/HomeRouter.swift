//
//  HomeRouter.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

class HomeRouter: HomePresenterToRouterProtocol {
    
    static func createView() -> HomeViewController {
        let view = HomeViewController.initWithDefaultNib()
        let presenter: HomeViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter as? HomePresenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
