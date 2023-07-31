//
//  DaysCollectionViewCell.swift
//  Trackizer
//
//  Created by Harsha AM on 30/06/23.
//

import UIKit

class DaysCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
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
    
    func configure(with model: DaysCollectionViewCellModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        cellImageView.image = model.image
        backgroundColor = model.backgroundColor
    }
    
    func addViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(cellImageView)

    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21),
            cellImageView.widthAnchor.constraint(equalToConstant: 6),
            cellImageView.heightAnchor.constraint(equalToConstant: 6)


        ])
    }

}

struct DaysCollectionViewCellModel {
    let title: String?
    let subtitle: String?
    let image: UIImage?
    let backgroundColor: UIColor?
}
