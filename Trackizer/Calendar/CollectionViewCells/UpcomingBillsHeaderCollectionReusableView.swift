//
//  UpcomingBillsCollectionReusableView.swift
//  Trackizer
//
//  Created by Harsha AM on 03/07/23.
//

import UIKit

class UpcomingBillsHeaderCollectionReusableView: UICollectionReusableView {
        
    let monthNameLabel: UILabel = {
        let label = UILabel()
        label.text = "January"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "01.01.2000"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "Grey30")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let upcomingBillTextLabel: UILabel = {
        let label = UILabel()
        label.text = "in upcoming bills"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "Grey30")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalBillLabel: UILabel = {
        let label = UILabel()
        label.text = "$23.99"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(monthNameLabel)
        addSubview(dateLabel)
        addSubview(upcomingBillTextLabel)
        addSubview(totalBillLabel)
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            monthNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            monthNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            dateLabel.topAnchor.constraint(equalTo: monthNameLabel.bottomAnchor),
            
            totalBillLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            totalBillLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            upcomingBillTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            upcomingBillTextLabel.topAnchor.constraint(equalTo: totalBillLabel.bottomAnchor),
        ])
    }
    
}
