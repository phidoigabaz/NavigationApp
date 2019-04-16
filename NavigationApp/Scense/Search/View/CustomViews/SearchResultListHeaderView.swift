//
//  SearchResultListHeaderView.swift
//  NavigationApp
//
//  Created by GEM on 4/16/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class SearchResultListHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var nearButton: UIButton!
    @IBOutlet weak var openNowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nearButton.setRadiusButton(nearButton.frame.height/2)
        nearButton.setBorderView(1, .black)
        openNowButton.setRadiusButton(openNowButton.frame.height/2)
        openNowButton.setBorderView(1, .black)
    }
}
