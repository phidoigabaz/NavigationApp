//
//  MapStyleTableViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/19/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class MapStyleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var thumbaieSatelliteImageView: UIImageView!
    @IBOutlet weak var thumbaiDarkImageView: UIImageView!
    
    @IBOutlet weak var whiteStyleButton: UIButton!
    @IBOutlet weak var satelliteStyleButton: UIButton!
    @IBOutlet weak var darkStyleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbaiImageView.setRadiusView(20)
        thumbaieSatelliteImageView.setRadiusView(20)
        thumbaiDarkImageView.setRadiusView(20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
