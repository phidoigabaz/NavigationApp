//
//  SettingItemTableViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/19/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class SettingItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.setRadiusView(avatarImageView.frame.height/2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
