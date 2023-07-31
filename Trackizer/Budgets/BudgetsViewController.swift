//
//  BudgetsViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 27/06/23.
//

import UIKit

class BudgetsViewController: UIViewController {

    let shape = CAShapeLayer()
    
    var signInBtn: CustomButton = {
        let signInBtn = CustomButton()

        signInBtn.configure(with: IconTextButtonViewModel(text: "Run", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Grey50")))
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        return signInBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(signInBtn)
        addConstraints()
        signInBtn.addTarget(self, action: #selector(addAnimations), for: .touchUpInside)
        addShape()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func addShape() {
        let cirPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2), radius: 80, startAngle: 3 * .pi, endAngle: .pi, clockwise: false)
//        let rectPath = UIBezierPath(rect: CGRect(x:view.frame.size.width / 2 - 25, y: view.frame.size.height / 2 - 50, width: 50, height: 50))
        
//        let triPath: UIBezierPath = getTriPath()
//        shape.path = rectPath.cgPath
        shape.path = cirPath.cgPath
        shape.strokeEnd = 0
        shape.lineWidth = 12
        shape.lineCap = .round
        shape.strokeColor = UIColor.systemRed.cgColor
        
        view.layer.addSublayer(shape)
    }
    
//    func getTriPath() -> UIBezierPath {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: view.frame.size.width / 2))
//        path.addLine(to: CGPoint(x: , y: <#T##CGFloat#>))
//    }
    
    @objc func addAnimations() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "animation")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            signInBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            signInBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
 }
