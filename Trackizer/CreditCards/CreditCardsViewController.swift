//
//  CreditCardsViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 27/06/23.
//

import UIKit

class CreditCardsViewController: UIViewController {

    let cardView: UIView = {
        let cardView = UIView()
        cardView.tag = 0
        cardView.backgroundColor = .white
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    let cardSecondView: UIView = {
        let cardView = UIView()
        cardView.tag = 1
        cardView.backgroundColor = .systemBlue
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    let cardThirdView: UIView = {
        let cardView = UIView()
        cardView.tag = 2
        cardView.backgroundColor = .systemCyan
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    let cardFourthView: UIView = {
        let cardView = UIView()
        cardView.tag = 3
        cardView.backgroundColor = .darkGray
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    var angle: Float = 2
    
    var views: [UIView] = []
    var alignViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        
        addConstraints()
        addSwipeGesture(view: cardView)
        addSwipeGesture(view: cardSecondView)
        addSwipeGesture(view: cardThirdView)
        addSwipeGesture(view: cardFourthView)

        cardSecondView.transform = cardSecondView.transform.rotated(by: 5 * .pi / 180)
        cardThirdView.transform = cardThirdView.transform.rotated(by: 10 * .pi / 180)
        cardFourthView.transform = cardFourthView.transform.rotated(by: 10 * .pi / 180)
        views = [cardView, cardSecondView, cardThirdView, cardFourthView]
        alignViews = views
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cardView.roundCorners([.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 16)
        cardSecondView.roundCorners([.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 16)
        cardThirdView.roundCorners([.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 16)
        cardFourthView.roundCorners([.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 16)
    }

    func addViews() {
        view.addSubview(cardView)
        view.addSubview(cardSecondView)
        view.addSubview(cardThirdView)
        view.addSubview(cardFourthView)
        view.insertSubview(cardSecondView, belowSubview: cardView)
        view.insertSubview(cardThirdView, belowSubview: cardSecondView)
        view.insertSubview(cardFourthView, belowSubview: cardThirdView)

    }
    
    func addSwipeGesture(view: UIView) {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAnimation(_:)))
        swipeLeftGesture.direction = .left
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAnimation(_:)))
        swipeRightGesture.direction = .right
        
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAnimation(_:)))
        swipeUpGesture.direction = .up
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAnimation(_:)))
        swipeDownGesture.direction = .down
        
        view.addGestureRecognizer(swipeDownGesture)
        view.addGestureRecognizer(swipeUpGesture)
        view.addGestureRecognizer(swipeRightGesture)
        view.addGestureRecognizer(swipeLeftGesture)
    }
    
    @objc func swipeAnimation(_ sender: UISwipeGestureRecognizer) {
        guard let currentView = sender.view else { return }
        
        let nextViewTag = (currentView.tag + 1) % views.count
        let nextView = views[nextViewTag]
        
        UIView.animate(withDuration: 0.25, animations: {
            self.swipeCardAnimation(currentView: currentView, direction: sender.direction)
            nextView.transform = CGAffineTransform.identity
        }) { (_) in
            self.alignViews.remove(at: 0)
            self.alignViews.append(currentView)
            self.view.sendSubviewToBack(currentView)
            currentView.transform = CGAffineTransform(rotationAngle: 10 * .pi / 180)
            self.view.bringSubviewToFront(nextView)
            self.alignViews[1].transform = CGAffineTransform(rotationAngle: 5 * .pi / 180)
        }
        

    }
    
    func swipeCardAnimation(currentView: UIView,direction: UISwipeGestureRecognizer.Direction) {
        switch direction {
        case .left:
            currentView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)

        case .right:
            currentView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
            
        case .up:
            currentView.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
            
        case .down:
            currentView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height)
            
        default:
            print("I can't do anything")
        }
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
//            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
//            cardView.trailingAnchor.constraint(equalTo: vi)
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 350),
            cardView.widthAnchor.constraint(equalToConstant: 250),
            
            cardSecondView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardSecondView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardSecondView.heightAnchor.constraint(equalToConstant: 350),
            cardSecondView.widthAnchor.constraint(equalToConstant: 250),
            
            cardThirdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardThirdView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardThirdView.heightAnchor.constraint(equalToConstant: 350),
            cardThirdView.widthAnchor.constraint(equalToConstant: 250),
            
            cardFourthView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardFourthView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardFourthView.heightAnchor.constraint(equalToConstant: 350),
            cardFourthView.widthAnchor.constraint(equalToConstant: 250)
            
            
        ])
    }
}
