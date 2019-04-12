//
//  BaseViewController.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView() {
        
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
        let homeVC = HomeViewController.initWithDefaultNib()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
