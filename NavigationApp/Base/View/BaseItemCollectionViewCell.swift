//
//  BaseItemCollectionViewCell.swift
//  NavigationApp
//
//  Created by GEM on 4/19/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Kingfisher

class BaseItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var thumbaiImageView: UIImageView!
    @IBOutlet weak var typeImageUIView: UIView!
    @IBOutlet weak var gradiantView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setRadiusView(10)
        thumbaiImageView.layer.cornerRadius = 10
        ratingLabel.layer.borderColor = UIColor.white.cgColor
        ratingLabel.layer.borderWidth = 1
        ratingLabel.layer.cornerRadius = 5
        typeImageView.image = typeImageView.image?.withRenderingMode(.alwaysTemplate)
        typeImageView.tintColor = UIColor.red
        typeImageUIView.layer.cornerRadius = 5
        
    }
    
    func bindingWithData(_ model: NearByModel) {
        titleLabel.text = model.name
        ratingLabel.text = String(model.rating)
        for i in model.types {
            if i == Types(rawValue: i).map { $0.rawValue } {
               typeLabel.text = i
               typeImageView.image = UIImage(named: i)
            } 
        }
        
        if let photos = model.photos.first?.photo_reference {
            if let url = URL(string: "\(Constants.photoUrl)\(photos)&key=\(Constants.GOOGLE_API_KEY)") {
                thumbaiImageView.kf.setImage(with: url)
            }
        }
    }
}
