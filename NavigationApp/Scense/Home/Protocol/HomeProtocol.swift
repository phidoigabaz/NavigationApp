//
//  HomeProtocol.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation

protocol HomeViewToPresenterProtocol: class {
    var view: PresenterToHomeViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
}

protocol PresenterToHomeViewProtocol: class {
    
}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomePresenterToInteractorProtocol? {get set}
}

protocol HomePresenterToRouterProtocol: class {
    var view: HomeViewToPresenterProtocol? {get set}
}

protocol InteractorToPresenterProtocol: class {
    func getPlaceNearYou()
}
