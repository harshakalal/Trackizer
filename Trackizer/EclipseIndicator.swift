//
//  EclipseIndicator.swift
//  Trackizer
//
//  Created by Harsha AM on 22/06/23.
//

import UIKit

class EclipseIndicator: UIView {
    var logoTitleView: LogoTitleView = {
        let logoTitleView = LogoTitleView()
        logoTitleView.label.font = UIFont(name: "Impact", size: 16)
        logoTitleView.mainStackView.spacing = 8
        logoTitleView.translatesAutoresizingMaskIntoConstraints = false
        return logoTitleView
    }()
    
    let shape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.lineWidth = 15
        shape.strokeColor = UIColor(named: "Orange")?.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        shape.lineCap = .round
        return shape
    }()
    
    let totalBudgetLabel: UILabel = {
        let label = UILabel()
        label.text = "$1,823"
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthBillsLabel: UILabel = {
       let label = UILabel()
        label.text = "This month bills"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(named: "Grey30")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkBudgetButton: CustomButton = {
        let budgetButton = CustomButton()
        budgetButton.configure(with: IconTextButtonViewModel(text: "See your budget", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Grey50")))
        budgetButton.translatesAutoresizingMaskIntoConstraints = false
        return budgetButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        
        addConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addIndicatorView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(logoTitleView)
        addSubview(totalBudgetLabel)
        addSubview(monthBillsLabel)
        addSubview(checkBudgetButton)
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            logoTitleView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40),
            logoTitleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75),
            logoTitleView.mainStackView.heightAnchor.constraint(equalToConstant: 19),
            logoTitleView.imageView.widthAnchor.constraint(equalToConstant: 16),
            logoTitleView.imageView.widthAnchor.constraint(equalToConstant: 19),
            
            totalBudgetLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalBudgetLabel.topAnchor.constraint(equalTo: logoTitleView.bottomAnchor, constant: 35),
            
            monthBillsLabel.topAnchor.constraint(equalTo: totalBudgetLabel.bottomAnchor, constant: 16),
            monthBillsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            checkBudgetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkBudgetButton.topAnchor.constraint(equalTo: monthBillsLabel.bottomAnchor, constant: 35),
            checkBudgetButton.widthAnchor.constraint(equalToConstant: 120),
            checkBudgetButton.heightAnchor.constraint(equalToConstant: 32),
            
        ])
    }
    
    func addIndicatorView() {
        let cirPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: (bounds.height / 2) + 15), radius: 130, startAngle: (.pi * 2)/2.65, endAngle: .pi / 4, clockwise: true)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = cirPath.cgPath
        trackLayer.lineWidth = 15
        trackLayer.strokeColor = UIColor(named: "Grey30")?.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        shape.path = cirPath.cgPath
        layer.addSublayer(trackLayer)
        layer.addSublayer(shape)
    }

}
