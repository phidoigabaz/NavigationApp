//
//  MenuHeaderTableViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/18/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class MenuHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    thumbaiImageView.setRadiusView(thumbaiImageView.frame.height/2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
