//
//  AddSubsViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 05/07/23.
//

import UIKit

class AddSubsViewController: UIViewController {

    let customShapeView: CustomShapeView = {
        let customShapeView = CustomShapeView()
        customShapeView.translatesAutoresizingMaskIntoConstraints = false
        return customShapeView
    }()
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ArrowDown"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Trash"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Subscription info"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(named: "Grey30")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineShape = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        addConstraints()
        addTargets()
    }
    
    func addViews() {
        
        view.backgroundColor = .brown
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(customShapeView)
        view.addSubview(leftButton)
        view.addSubview(titleLabel)
        view.addSubview(rightButton)
    }
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            customShapeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            customShapeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            customShapeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customShapeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            
            rightButton.trailingAnchor.constraint(equalTo: customShapeView.trailingAnchor, constant: -25),
            rightButton.topAnchor.constraint(equalTo: customShapeView.topAnchor, constant: 32),
            rightButton.widthAnchor.constraint(equalToConstant: 24),
            rightButton.heightAnchor.constraint(equalToConstant: 24),
                    
            leftButton.leadingAnchor.constraint(equalTo: customShapeView.leadingAnchor, constant: 25),
            leftButton.topAnchor.constraint(equalTo: customShapeView.topAnchor, constant: 32),
            leftButton.widthAnchor.constraint(equalToConstant: 24),
            leftButton.heightAnchor.constraint(equalToConstant: 24),
                    
            titleLabel.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -25),
            titleLabel.topAnchor.constraint(equalTo: customShapeView.topAnchor, constant: 32)

        ])
    }
    
    func addTargets() {
        leftButton.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(didTapSettings), for: .touchUpInside)
    }
    
    @objc func closeVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupCustomShape() {
        
        let line: UIBezierPath = getLinePath()
        
        lineShape.path = line.cgPath
        lineShape.lineWidth = 5
        lineShape.strokeStart = 0
        lineShape.strokeColor = UIColor.red.cgColor
        customShapeView.layer.addSublayer(lineShape)
        
    }
    
    func getLinePath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 42, y: 10))
        path.addLine(to: CGPoint(x: 300, y: 10))
        path.close()
        return path
    }
    
    @objc func didTapSettings() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 7
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        lineShape.add(animation, forKey: "animation")
    }

}
