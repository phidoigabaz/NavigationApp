//
//  UIButtomCustomExtension.swift
//  FramesLayout
//
//  Created by GEM on 4/5/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setRadiusButton(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
