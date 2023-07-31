//
//  CustomView.swift
//  Trackizer
//
//  Created by Harsha AM on 21/06/23.
//

import UIKit

class CustomView: UIView {
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(named: "Grey30")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureView()
    }
    
    func addViews() {
        addSubview(leftButton)
        addSubview(titleLabel)
        addSubview(rightButton)
    }
    
    func configureView() {
        self.roundCorners([.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 30)
    }
    
    func configure(with model: CustomViewModel) {
        if let leftButtonImage = model.leftButtonImage {
            leftButton.setImage(leftButtonImage, for: .normal)
        } else {
            leftButton.isHidden = true
        }
        
        if let rightButtonImage = model.rightButtonImage {
            rightButton.setImage(rightButtonImage, for: .normal)
        } else {
            rightButton.isHidden = true
        }

        if let titleText = model.title {
            titleLabel.text = titleText
        } else {
            titleLabel.isHidden = true
        }
    }
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            rightButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            rightButton.widthAnchor.constraint(equalToConstant: 24),
            rightButton.heightAnchor.constraint(equalToConstant: 24),
            
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            leftButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            leftButton.widthAnchor.constraint(equalToConstant: 24),
            leftButton.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -25),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60)
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
//            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
//            stackView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}

struct CustomViewModel {
    let leftButtonImage: UIImage?
    let title: String?
    let rightButtonImage: UIImage?
}
