//
//  LineView.swift
//  Trackizer
//
//  Created by Harsha AM on 12/07/23.
//

import UIKit

class LineView: UIView {
    
    let shape = CAShapeLayer()
    let baseShape = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path: UIBezierPath = getPath(rect: rect)
        
        shape.path = path.cgPath
        shape.strokeColor = UIColor.systemRed.cgColor
        shape.strokeEnd = 0
        shape.lineWidth = 4
        path.lineWidth = 4
        
        baseShape.path = path.cgPath
        baseShape.strokeColor = UIColor(named: "Grey70")?.cgColor
        baseShape.strokeEnd = 0.80
        baseShape.lineWidth = 4
        layer.addSublayer(baseShape)
        layer.addSublayer(shape)


        
    }
    
    func getPath(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        
        let lineCount = 4
        let spaceBetweenLines = 8
        let lineSpacing = (rect.width - CGFloat(spaceBetweenLines) * CGFloat(lineCount - 1)) / CGFloat(lineCount)
        
        for i in 0...lineCount {
            let startX = ((lineSpacing) + CGFloat(spaceBetweenLines)) * CGFloat(i)
            let startY = rect.height / 2
            
            path.move(to: CGPoint(x: startX, y: startY))
            
            path.addLine(to: CGPoint(x: startX + lineSpacing, y: startY))
        }
        return path
    }
    
    
}
