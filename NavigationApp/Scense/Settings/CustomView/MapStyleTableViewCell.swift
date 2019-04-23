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
    
    @IBOutlet var radioButton: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbaiImageView.setRadiusView(10)
        thumbaiImageView.setBorderView(1, .black)
        thumbaieSatelliteImageView.setRadiusView(10)
        thumbaieSatelliteImageView.setBorderView(1, .lightGray)
        thumbaiDarkImageView.setRadiusView(10)
        thumbaiDarkImageView.setBorderView(1, .groupTableViewBackground)
    }

    @IBAction func onSelectionMapStyle(_ sender: UIButton) {
        sender.setImage(UIImage(named: "circle-in-black"), for: .selected)
        sender.setImage(UIImage(named: "circle-in-white"), for: .normal)
        for  aButton:UIButton in radioButton! {
            sender.isSelected = true
            aButton.isSelected = false
        }
        
        print(sender.currentTitle)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
