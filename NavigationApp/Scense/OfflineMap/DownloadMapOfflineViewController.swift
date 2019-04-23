//
//  DownloadMapOfflineViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/11/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class DownloadMapOfflineViewController: BaseViewController {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBarItemAction))
        self.navigationController?.navigationBar.tintColor = .black
        thumbaiImageView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth, height: Constants.iHeight), colors: [.clear, .black], alpha: 1)
    }
}
