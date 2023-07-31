//
//  HomeViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 20/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let customRoundedView: CustomView = {
        let view = CustomView()
        view.configure(with: CustomViewModel(leftButtonImage: nil, title: nil, rightButtonImage: UIImage(named: "Settings")))
        view.backgroundColor = UIColor(named: "Grey70")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let eclipseIndicator: EclipseIndicator = {
        let eclipseIndicator = EclipseIndicator()
        eclipseIndicator.translatesAutoresizingMaskIntoConstraints = false
        return eclipseIndicator
    }()
    
    let subsStackView: UIStackView = {
        let subsStackView = UIStackView()
        subsStackView.spacing = 8
        subsStackView.axis = .horizontal
        subsStackView.translatesAutoresizingMaskIntoConstraints = false
        return subsStackView
    }()
    
    let activeSubButton: CustomTitleSubtitleButton = {
        let activeSubButton = CustomTitleSubtitleButton()
        activeSubButton.configure(with: CustomTitleSubtitleButtonModel(title: "Active subs", subtitle: "13", strokeColor: UIColor(named: "Orange")))
        activeSubButton.translatesAutoresizingMaskIntoConstraints = false
        return activeSubButton
    }()
    
    let highestSubButton: CustomTitleSubtitleButton = {
        let highestSubButton = CustomTitleSubtitleButton()
        highestSubButton.configure(with: CustomTitleSubtitleButtonModel(title: "Highest subs", subtitle: "$19.99", strokeColor: UIColor(named: "Violet")))
        highestSubButton.translatesAutoresizingMaskIntoConstraints = false
        return highestSubButton
    }()
    
    let lowestSubButton: CustomTitleSubtitleButton = {
        let lowestSubButton = CustomTitleSubtitleButton()
        lowestSubButton.configure(with: CustomTitleSubtitleButtonModel(title: "Lowest subs", subtitle: "$19.99", strokeColor: UIColor(named: "LightBlue")))
        lowestSubButton.translatesAutoresizingMaskIntoConstraints = false
        return lowestSubButton
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(named: "Grey80")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let tableHeaderView: CustomTabsView = {
        let tableHeaderView = CustomTabsView()
        tableHeaderView.leftButton.backgroundColor = UIColor(named: "Grey30")
        tableHeaderView.leftButton.setTitleColor(.white, for: .normal)
        tableHeaderView.backgroundColor = UIColor(named: "Grey100")
        tableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return tableHeaderView
    }()
    
    var subscribedArray: [SubscribedArrayModel] = [
        SubscribedArrayModel(image: UIImage(named: "SpotifyLogo"), subsName: "Spotify", subsAmount: "$10.00"),
        SubscribedArrayModel(image: UIImage(named: "YTPremiumLogo"), subsName: "Youtube", subsAmount: "$18.21"),
        SubscribedArrayModel(image: UIImage(named: "OneDriveLogo"), subsName: "OneDrive", subsAmount: "$20.89")
    ]
    
    var isTableHeaderSelected: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "Grey80")
        addViews()
        registerTableViewCells()
        addConstraints()
        addTargets()
    }

    func addViews() {
        view.addSubview(customRoundedView)
        view.addSubview(tableView)
        customRoundedView.addSubview(eclipseIndicator)
        customRoundedView.addSubview(subsStackView)
        subsStackView.addArrangedSubview(activeSubButton)
        subsStackView.addArrangedSubview(highestSubButton)
        subsStackView.addArrangedSubview(lowestSubButton)
    }
    
    func registerTableViewCells() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SubscribedTableViewCell.self, forCellReuseIdentifier: "SubscribedTableViewCell")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            customRoundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customRoundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customRoundedView.topAnchor.constraint(equalTo: view.topAnchor),
            customRoundedView.heightAnchor.constraint(equalToConstant: 460),
            
            eclipseIndicator.leadingAnchor.constraint(equalTo: customRoundedView.leadingAnchor, constant: 44),
            eclipseIndicator.trailingAnchor.constraint(equalTo: customRoundedView.trailingAnchor, constant: -45),
            eclipseIndicator.topAnchor.constraint(equalTo: customRoundedView.topAnchor, constant: 75),
            eclipseIndicator.heightAnchor.constraint(equalToConstant: 300),
            
//            subsStackView.topAnchor.constraint(equalTo: eclipseIndicator.bottomAnchor),
            subsStackView.leadingAnchor.constraint(equalTo: customRoundedView.leadingAnchor, constant: 24),
            subsStackView.bottomAnchor.constraint(equalTo: customRoundedView.bottomAnchor, constant: -24),
            subsStackView.trailingAnchor.constraint(equalTo: customRoundedView.trailingAnchor, constant: -24),
            subsStackView.heightAnchor.constraint(equalToConstant: 68),
            
            tableView.topAnchor.constraint(equalTo: customRoundedView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addTargets() {
        customRoundedView.rightButton.addTarget(self, action: #selector(didTapSettings), for: .touchUpInside)
        tableHeaderView.leftButton.addTarget(self, action: #selector(didTapLeftButton), for: .touchUpInside)
        tableHeaderView.rightButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)
    }

    @objc func didTapLeftButton(_ sender: UIButton) {
        configureHeaderButtons(sender)
        changeTableView(sender)
//        tableHeaderView.leftButton.backgroundColor = UIColor(named: "Grey30")
//        tableHeaderView.leftButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func didTapRightButton(_ sender: UIButton) {
        configureHeaderButtons(sender)
        changeTableView(sender)
    }
    
    func changeTableView(_ sender: UIButton) {
        if sender == tableHeaderView.leftButton {
            isTableHeaderSelected = true
        } else {
            isTableHeaderSelected = false
        }
        tableView.reloadData()
    }
    
    func configureHeaderButtons(_ sender: UIButton) {
        tableHeaderView.leftButton.backgroundColor = UIColor(named: "Grey100")
        tableHeaderView.rightButton.backgroundColor = UIColor(named: "Grey100")
        sender.backgroundColor = UIColor(named: "Grey30")
        sender.setTitleColor(.white, for: .normal)
    }
    
    @objc func didTapSettings() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 1
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        eclipseIndicator.shape.add(animation, forKey: "animation")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { subscribedArray.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubscribedTableViewCell", for: indexPath) as? SubscribedTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "Grey80")
        cell.configure(with: subscribedArray[indexPath.row])
        cell.dateLabel.isHidden = isTableHeaderSelected
        cell.subsIconView.isHidden = !isTableHeaderSelected
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.addSubview(tableHeaderView)
        addTableHeaderConstraints()
        return tableHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func addTableHeaderConstraints() {
        NSLayoutConstraint.activate([
            tableHeaderView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 16),
            tableHeaderView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -16),
            tableHeaderView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            tableHeaderView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
            tableHeaderView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

struct SubscribedArrayModel {
    let image: UIImage?
    let subsName: String?
    let subsAmount: String?
}
