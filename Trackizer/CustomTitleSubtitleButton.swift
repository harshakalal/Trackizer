//
//  CustomTitleSubtitleLabel.swift
//  Trackizer
//
//  Created by Harsha AM on 23/06/23.
//

import UIKit

class CustomTitleSubtitleButton: UIButton {

    let shape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.lineWidth = 2
//        shape.strokeColor = UIColor(named: "Orange")?.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 1
        shape.lineCap = .round
        return shape
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addLineToTop()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: CustomTitleSubtitleButtonModel) {
        configuration = UIButton.Configuration.filled()
        configuration?.background.backgroundColor = UIColor(named: "Grey50")
        configuration?.cornerStyle = .large
        
        var attText = AttributedString.init(model.title ?? "")
        attText.font = .systemFont(ofSize: 12, weight: .bold)
        configuration?.attributedTitle = attText
        configuration?.titleAlignment = .center
        configuration?.subtitle = model.subtitle
        shape.strokeColor = model.strokeColor?.cgColor
    }
    
    func addLineToTop() {
        let path = UIBezierPath()
        let lineHeight: CGFloat = 1
        let startPoint = CGPoint(x: bounds.width / 4, y: lineHeight)
        let endPoint = CGPoint(x: bounds.width/2 + bounds.width/4, y: lineHeight)

        path.move(to: startPoint)
        path.addLine(to: endPoint)
        shape.path = path.cgPath
        layer.addSublayer(shape)
    }
    
}

struct CustomTitleSubtitleButtonModel {
    let title: String?
    let subtitle: String?
    let strokeColor: UIColor?
}
