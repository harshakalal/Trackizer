//
//  CustomShapeView.swift
//  Trackizer
//
//  Created by Harsha AM on 05/07/23.
//

import UIKit

class CustomShapeView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path: UIBezierPath = getCustomPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 0
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor(named: "Grey70")?.cgColor
        layer.addSublayer(shape)
        
        let linePath: UIBezierPath = getDividerPath()
        let dividerShape = CAShapeLayer()
        dividerShape.path = linePath.cgPath
        dividerShape.lineWidth = 2
        dividerShape.strokeColor = UIColor.black.cgColor
        dividerShape.lineDashPattern = [8, 12]
        layer.addSublayer(dividerShape)
        
//        let belowViewPath: UIBezierPath = getBelowViewPath()
//        let viewBelowDividerShape = CAShapeLayer()
//        viewBelowDividerShape.path = UIBezierPath(rect: CGRect(x: 0, y: frame.size.height / 2 - 34, width: frame.size.width, height: frame.size.height / 2 + 34)).cgPath
//        viewBelowDividerShape.fillColor = UIColor.red.cgColor
//        layer.addSublayer(viewBelowDividerShape)
    }
    
    func getCustomPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 12, y: 0))
        
        path.addLine(to: CGPoint(x: frame.size.width - 12, y: 0))
        path.addArc(withCenter: CGPoint(x: frame.size.width - 12, y: 12), radius: 12, startAngle: (.pi / 2) * 3, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: frame.size.width, y: ((frame.size.height / 2) - 50)))
        path.addArc(withCenter: CGPoint(x: frame.size.width, y: (frame.size.height / 2) - 50 + 12), radius: 12, startAngle: (3 * .pi) / 2, endAngle:  .pi / 2, clockwise: false)
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height - 12))
        path.addArc(withCenter: CGPoint(x: frame.size.width - 12, y: frame.size.height - 12), radius: 12, startAngle: 0, endAngle: .pi / 2, clockwise: true)
        path.addLine(to: CGPoint(x: 12, y: frame.size.height))
        path.addArc(withCenter: CGPoint(x: 12, y: frame.size.height - 12), radius: 12, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: (frame.size.height / 2) - 50 ))
        path.addArc(withCenter: CGPoint(x: 0, y: frame.size.height / 2 - 50 + 12), radius: 12, startAngle: .pi / 2, endAngle: (3 * .pi) / 2, clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: 12))
        path.addArc(withCenter: CGPoint(x: 12, y: 12), radius: 12, startAngle: .pi, endAngle: (.pi / 2) * 3, clockwise: true)
        path.close()
        return path
    }
    
    func getDividerPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 12, y: (frame.size.height / 2) - 50 + 12))
        path.addLine(to: CGPoint(x: frame.size.width - 12, y: (frame.size.height / 2) - 50 + 12))
        path.close()
        return path
    }
    
//    func getBelowViewPath() -> UIBezierPath {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: <#T##Double#>, y: <#T##Double#>))
//    }
//
    
    
}
