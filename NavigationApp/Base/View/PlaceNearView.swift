//
//  PlaceNearYou.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit

protocol PlaceNearViewDelegate {
    func onDismissView(_ view: PlaceNearView,_ sender: Any)
}
class PlaceNearView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    var delegate: PlaceNearViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
       titleLabel.text = "Saved places \nnear you"
//       containerView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth,
//                                                             height: containerView.bounds.height),
//                                                             colors: [.clear, .white])
    }
    
    @IBAction func onBackAction(_ sender: Any) {
        delegate?.onDismissView(self, sender)
    }
    
    class func instanceFromNib() -> PlaceNearView {
        let view = UINib(nibName: PlaceNearView.classString(), bundle: nil).instantiate(withOwner: self, options: nil).first as? PlaceNearView
        return view!
    }
}
