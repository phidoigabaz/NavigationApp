//
//  SettingSizeTableViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/22/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class SettingSizeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
