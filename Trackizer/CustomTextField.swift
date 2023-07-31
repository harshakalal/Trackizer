//
//  CustomTextField.swift
//  Trackizer
//
//  Created by Harsha AM on 20/06/23.
//

import UIKit

class CustomTextField: UIView {
    
    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 4
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(named: "Grey50")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 14, weight: .semibold)
//        textfield.borderStyle = .none
        textfield.textColor = .white
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = UIColor(named: "Grey80")
        textfield.smartDashesType = .no
        textfield.layer.borderColor = UIColor(named: "Grey50")?.cgColor
        textfield.layer.borderWidth = 1
        textfield.frame.size.height = 48
        textfield.layer.cornerRadius = 16
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.clipsToBounds = true
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(textfield)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 16),
            textfield.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func configure(with model: CustomButtonTextModel) {
        label.text = model.labelText
    }
    
}

struct CustomButtonTextModel {
    let labelText: String?
}
