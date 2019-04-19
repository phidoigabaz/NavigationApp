//
//  BaseViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Mapbox

class BaseViewController: UIViewController {
    @IBOutlet weak var mapView: MGLMapView!
    var baseDataModel = BaseDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView() {
        
    }
    
    func setupMapView() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationItem.hidesBackButton = true
        mapView.styleURL = MGLStyle.lightStyleURL
        mapView.logoView.isHidden = true
        mapView.attributionButton.isHidden = true
    }
    
    @objc func menuButtonBarItem() {
        print("menu")
        //mm_drawerController.toggle(.left, animated: true, completion: nil)
    }
    
    @objc func searchButtonBarItem() {
        print("search")
    }
    
    @objc func skipBarItemAction() {
        print("skip")
        let homeVC = HomeRouter.createView()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
