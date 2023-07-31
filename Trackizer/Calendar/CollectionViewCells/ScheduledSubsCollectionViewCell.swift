//
//  ScheduledSubsCollectionViewCell.swift
//  Trackizer
//
//  Created by Harsha AM on 03/07/23.
//

import UIKit

class ScheduledSubsCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Spotify"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subsAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "$5.92"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SpotifyLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "Grey50")
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        
        addSubview(titleLabel)
        addSubview(subsAmountLabel)
        addSubview(cellImageView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellImageView.widthAnchor.constraint(equalToConstant: 40),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            
            subsAmountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            subsAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: subsAmountLabel.topAnchor, constant: -5)

        ])
    }
    
}
