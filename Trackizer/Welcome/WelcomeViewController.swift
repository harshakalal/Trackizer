//
//  WelcomeViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 09/06/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var containerView: UIView = {
       let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    var logoTitleView: LogoTitleView = {
        let logoTitleView = LogoTitleView()
        logoTitleView.translatesAutoresizingMaskIntoConstraints = false
        return logoTitleView
    }()
    
    var leftBgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LeftImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var centerBgImageView: UIImageView = {
        let centerBgImageView = UIImageView()
        centerBgImageView.image = UIImage(named: "CenterImage")
        centerBgImageView.translatesAutoresizingMaskIntoConstraints = false
        return centerBgImageView
    }()
    
    var rightBgImageView: UIImageView = {
        let rightBgImageView = UIImageView()
        rightBgImageView.image = UIImage(named: "RightImage")
        rightBgImageView.translatesAutoresizingMaskIntoConstraints = false
        return rightBgImageView
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Track every penny with confidence.\n Achieve financial clarity and build a solid financial foundation."
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    var getStartedButton: CustomButton = {
        let iconButton = CustomButton()

        iconButton.configure(with: IconTextButtonViewModel(text: "Get Started", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Orange")))
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        return iconButton
    }()
    
    var signInFlowButton: CustomButton = {
        let signInFlowButton = CustomButton()

        signInFlowButton.configure(with: IconTextButtonViewModel(text: "I have an account", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Grey50")))
        signInFlowButton.translatesAutoresizingMaskIntoConstraints = false
        return signInFlowButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationController?.isNavigationBarHidden = true
        addTargets()
        setupViews()
        setupConstraints()
        
    }
    
    func addTargets() {
        getStartedButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    
    @objc func navigate() {
        navigationController?.pushViewController(SocialAccountSignUpViewController(), animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(named: "Grey80")
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.addSubview(logoTitleView)
        scrollView.addSubview(leftBgImage)
        scrollView.addSubview(centerBgImageView)
        scrollView.addSubview(rightBgImageView)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(getStartedButton)
        scrollView.addSubview(signInFlowButton)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 750),
            
            logoTitleView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 115),
            logoTitleView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -99),
//            logoTitleView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoTitleView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            
            leftBgImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            leftBgImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            
            centerBgImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            centerBgImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            centerBgImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            centerBgImageView.topAnchor.constraint(equalTo: logoTitleView.bottomAnchor, constant: 59),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: centerBgImageView.bottomAnchor),
            
            getStartedButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            getStartedButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            getStartedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            getStartedButton.heightAnchor.constraint(equalToConstant: 52),
            
            signInFlowButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            signInFlowButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            signInFlowButton.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 16),
            signInFlowButton.heightAnchor.constraint(equalToConstant: 52),
            
            rightBgImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 263),
            rightBgImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            rightBgImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 396)
            
        ])
    }
}

