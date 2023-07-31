//
//  Logo+TitleView.swift
//  Trackizer
//
//  Created by Harsha AM on 12/06/23.
//

import UIKit

class LogoTitleView: UIView {
    var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.spacing = 13
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
//        mainStackView.alignment = .center
        return mainStackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "Trackizer"
        label.font = UIFont(name: "Impact", size: 28)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(label)
        addSubview(mainStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
//            mainStackView.heightAnchor.constraint(equalToConstant: 29),
            
            imageView.heightAnchor.constraint(equalToConstant: 28),
            imageView.widthAnchor.constraint(equalToConstant: 29)
        ])
    }
}
