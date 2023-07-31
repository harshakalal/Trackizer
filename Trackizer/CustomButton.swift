//
//  CustomButton.swift
//  Trackizer
//
//  Created by Harsha AM on 12/06/23.
//

import UIKit

class CustomButton: UIButton {
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        addSubview(label)
        addSubview(iconImageView)
        clipsToBounds = true
    }
    
    func configure(with viewModel: IconTextButtonViewModel) {
        label.text = viewModel.text
        label.textColor = viewModel.textColor
        if let imageView = viewModel.iconImage {
            iconImageView.image = imageView
            iconImageView.isHidden = false
        } else {
            iconImageView.image = nil
            iconImageView.isHidden = true
        }
        backgroundColor = viewModel.backgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.sizeToFit()
        
        layer.cornerRadius = frame.size.height / 2
        if !iconImageView.isHidden {
            let iconSize: CGFloat = 18
            let totalWidth = label.frame.size.width + iconSize + 8
            let iconX = (frame.size.width - totalWidth) / 2
            
            iconImageView.frame = CGRect(x: iconX,
                                          y: (frame.size.height - iconSize) / 2,
                                          width: iconSize,
                                          height: iconSize)
            
            label.frame = CGRect(x: iconImageView.frame.maxX + 8,
                                 y: 0,
                                 width: label.frame.size.width,
                                 height: frame.size.height)
        } else {
            label.frame = CGRect(x: (frame.size.width - label.frame.size.width) / 2,
                                 y: 0,
                                 width: label.frame.size.width,
                                 height: frame.size.height)
        }
    }
    
}


struct IconTextButtonViewModel {
    let text: String?
    let textColor: UIColor?
    let iconImage: UIImage?
    let backgroundColor: UIColor?
}

