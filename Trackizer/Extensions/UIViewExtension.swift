//
//  UIViewExtension.swift
//  Trackizer
//
//  Created by Harsha AM on 21/06/23.
//

import UIKit

extension UIView {

    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        var cornerMask = UIRectCorner()
        if(corners.contains(.layerMinXMinYCorner)){
            cornerMask.insert(.topLeft)
        }
        if(corners.contains(.layerMaxXMinYCorner)){
            cornerMask.insert(.topRight)
        }
        if(corners.contains(.layerMinXMaxYCorner)){
            cornerMask.insert(.bottomLeft)
        }
        if(corners.contains(.layerMaxXMaxYCorner)){
            cornerMask.insert(.bottomRight)
        }
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
