//
//  CustomTabBarViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 26/06/23.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSomeTabItems()
    }
    
    override func loadView() {
        super.loadView()
        
        setupCustomTabBar()
    }
    
    func addSomeTabItems() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: BudgetsViewController())
        let vc3 = UINavigationController(rootViewController: CalendarViewController())
        let vc4 = UINavigationController(rootViewController: CreditCardsViewController())
        setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        guard let items = tabBar.items else { return}
        items[0].image = UIImage(named: "Home")
        items[1].image = UIImage(named: "Budgets")
        items[2].image = UIImage(named: "Calendar")
        items[3].image = UIImage(named: "CreditCards")
    }
    
    func setupCustomTabBar() {
        let customTabBar = CustomTabBar()
        customTabBar.middleButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        self.setValue(customTabBar, forKey: "tabBar")
        let path: UIBezierPath = getCustomPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
//        shape.strokeColor =
        shape.fillColor = UIColor(named: "Grey60")?.cgColor
        shape.lineWidth = 2
        self.tabBar.layer.insertSublayer(shape, at: 0)
//        self.tabBar.itemWidth = 66
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 20
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = UIColor(named: "Grey30")
        
    }
    
    func getCustomPath() -> UIBezierPath {
        let path = UIBezierPath()
        let frameWidth = self.tabBar.bounds.width - 20
        let frameHeight = self.tabBar.bounds.height + 6
        let holeWidth = 66
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)
        print(frameWidth)
        print(frameHeight)
        print(leftXUntilHole)
        
        path.move(to: CGPoint(x: 10, y: -10))
        path.addLine(to: CGPoint(x: leftXUntilHole - 20, y: -10))
        path.addCurve(to: CGPoint(x: leftXUntilHole + 20, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + 20, y: -10), controlPoint2: CGPoint(x: leftXUntilHole + 19, y: -10))
        path.addCurve(to: CGPoint(x: leftXUntilHole + 20 + 60, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + 20, y: 40), controlPoint2: CGPoint(x: leftXUntilHole + 20 + 60, y: 40))
        path.addCurve(to: CGPoint(x: leftXUntilHole + 20 + 60 + 10, y: -10), controlPoint1: CGPoint(x: leftXUntilHole + 20 + 60, y: -10), controlPoint2: CGPoint(x: leftXUntilHole + 20 + 60 + 10, y: -10))
        path.addLine(to: CGPoint(x: leftXUntilHole + 20 + 60 + leftXUntilHole, y: -10))
        path.addLine(to: CGPoint(x: leftXUntilHole + 20 + 60 + leftXUntilHole, y: 45))
        path.addLine(to: CGPoint(x: 10, y: 45))
        
        path.close()
        return path
    }
    
    @objc func navigate() {
        let destVC = AddSubsViewController()
        destVC.modalPresentationStyle = .fullScreen
        navigationController?.present(destVC, animated: true)
    }
}

extension UIColor {
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (pureString.hasPrefix("#")) {
            pureString.remove(at: pureString.startIndex)
        }
        if ((pureString.count) != 6) {
            return nil
        }
        let scanner = Scanner(string: pureString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0))
            return
        }
        return nil
    }
}


class CustomTabBar: UITabBar {
    
    let middleButton : UIButton = {
       let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        btn.setTitle("", for: .normal)
        btn.backgroundColor = UIColor(named: "Orange")
        btn.layer.cornerRadius = 20
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        btn.setImage(UIImage(named: "MiddleButton"), for: .normal)
        return btn
    }()
    
        override func layoutSubviews() {
            super.layoutSubviews()
            addSubview(middleButton)
                        
            middleButton.layer.cornerRadius = 48 / 2
            let middleButtonSize: CGFloat = 48.0
            var middleButtonFrame = middleButton.frame
            middleButtonFrame.origin.y = -20.0 // Adjust the vertical position of the middle button
            
            let itemCount = items?.count ?? 0
            let itemWidth = bounds.width / CGFloat(itemCount) - 30.0
            var itemIndex: CGFloat = 0
            self.itemSpacing = 40
            
            for subview in subviews {
                if subview is UIControl {
                    var newX = itemWidth * itemIndex + 10
                    if itemIndex == 0 {
                        newX = itemWidth * itemIndex + 10
                    } else if itemIndex == 1 {
                        newX = itemWidth * itemIndex + 30
                    } else if itemIndex == 2 {
                        newX = itemWidth * itemIndex + 90
                    } else if itemIndex == 3 {
                        newX = itemWidth * itemIndex + 106
                    }
                    
                    subview.frame = CGRect(x: newX, y: subview.frame.origin.y, width: itemWidth, height: subview.frame.size.height - 4.0)
                    itemIndex += 1
                }
            }
            
            middleButtonFrame.origin.x = bounds.midX - middleButtonSize / 2.0 + 7.0 // Center the middle button horizontally
            
            middleButton.frame = middleButtonFrame
        }

}
