//
//  CustomTabsView.swift
//  Trackizer
//
//  Created by Harsha AM on 23/06/23.
//

import UIKit

class CustomTabsView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor(named: "Grey100")
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        leftButton.setTitle("Your subscriptions", for: .normal)  
        leftButton.setTitleColor(UIColor(named: "Grey30"), for: .normal)
        leftButton.backgroundColor = UIColor(named: "Grey100")
        leftButton.layer.cornerRadius = 10
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        return leftButton
    }()
    
    let rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        rightButton.setTitle("Upcoming Bills", for: .normal)
        rightButton.setTitleColor(UIColor(named: "Grey30"), for: .normal)
        rightButton.backgroundColor = UIColor(named: "Grey100")
        rightButton.layer.cornerRadius = 10
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        return rightButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners([.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 16)

        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        backgroundColor = UIColor(named: "Grey100")
        addSubview(stackView)
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(rightButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  9),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant:  9),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9)
            
        ])
    }
}
