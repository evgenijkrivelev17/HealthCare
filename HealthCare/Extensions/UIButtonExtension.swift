//
//  UIButtonExtension.swift
//  HealthCare
//
//  Created by Евгений on 9/11/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
