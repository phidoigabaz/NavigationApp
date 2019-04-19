//
//  MenuSetupTableViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/18/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

class MenuSetupTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        switchButton.setRadiusView(switchButton.frame.height/2)
        switchButton.setBorderView(1, .black)
    }
    
    func bindingWithData(_ index: Int,_ lastRowIndex: Int) {
        titleLabel.font = index == lastRowIndex - 1 ? UIFont.systemFont(ofSize: 17.0, weight: .regular) : UIFont.systemFont(ofSize: 17.0, weight: .heavy)
        switchButton.isHidden = index == lastRowIndex - 1 ? true : false
        lineView.isHidden = index == lastRowIndex - 1 ? true : false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
