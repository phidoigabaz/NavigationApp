//
//  HomeItemCollectionViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/12/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class HomeItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maxWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setBorderView(1, .black)
        self.setRadiusView(self.frame.height/15)
        self.maxWidthConstraint.constant = UIScreen.main.bounds.width - 8 * 2 - 8 * 2
    }
}
