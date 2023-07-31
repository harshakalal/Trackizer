//
//  SubscribedTableViewCell.swift
//  Trackizer
//
//  Created by Harsha AM on 24/06/23.
//

import UIKit

class SubscribedTableViewCell: UITableViewCell {

    let containerView: UIView = {
        let containerView = UIView()
        containerView.layer.cornerRadius = 14
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(named: "Grey50")?.cgColor
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var subsIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var dateLabel: CustomTitleSubtitleButton = {
        let dateLabel = CustomTitleSubtitleButton()
        dateLabel.configure(with: CustomTitleSubtitleButtonModel(title: "Jun", subtitle: "5", strokeColor: nil))
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    var subsNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subsAmountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        addViews()
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: SubscribedArrayModel) {
        subsIconView.image = model.image
        subsNameLabel.text = model.subsName
        subsAmountLabel.text = model.subsAmount
    }
    
    func addViews() {
        addSubview(containerView)
        addSubview(stackView)
        stackView.addArrangedSubview(subsIconView)
        stackView.addArrangedSubview(dateLabel)
        containerView.addSubview(subsNameLabel)
        containerView.addSubview(subsAmountLabel)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

            
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            subsIconView.widthAnchor.constraint(equalToConstant: 40),
            subsIconView.heightAnchor.constraint(equalToConstant: 40),
            dateLabel.widthAnchor.constraint(equalToConstant: 48),
            dateLabel.heightAnchor.constraint(equalToConstant: 40),
            
            subsNameLabel.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 12),
            subsNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            subsNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
//            subsNameLabel.trailingAnchor.constraint(equalTo: subsAmountLabel.leadingAnchor, constant: -12),
            
//            subsAmountLabel.leadingAnchor.constraint(equalTo: subsNameLabel.leadingAnchor, constant: 12),
            subsAmountLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            subsAmountLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            subsAmountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)

        ])
    }
    
}
