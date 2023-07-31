//
//  SocialAccountSignUpViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 19/06/23.
//

import UIKit

class SocialAccountSignUpViewController: UIViewController {
    
    var logoTitleView: LogoTitleView = {
        let logoTitleView = LogoTitleView()
        logoTitleView.translatesAutoresizingMaskIntoConstraints = false
        return logoTitleView
    }()
    
    var signupWithApple: CustomButton = {
        let signupWithApple = CustomButton()

        signupWithApple.configure(with: IconTextButtonViewModel(text: "Sign up with Apple", textColor: .white, iconImage: UIImage(named: "Apple"), backgroundColor: .black))
        signupWithApple.translatesAutoresizingMaskIntoConstraints = false
        return signupWithApple
    }()
    
    var signupWithGoogle: CustomButton = {
        let signupWithGoogle = CustomButton()

        signupWithGoogle.configure(with: IconTextButtonViewModel(text: "Sign up with Google", textColor: .black, iconImage: UIImage(named: "Google"), backgroundColor: .white))
        signupWithGoogle.translatesAutoresizingMaskIntoConstraints = false
        return signupWithGoogle
    }()
    
    var signupWithFB: CustomButton = {
        let signupWithFB = CustomButton()

        signupWithFB.configure(with: IconTextButtonViewModel(text: "Sign up with Facebook", textColor: .white, iconImage: UIImage(named: "Facebook"), backgroundColor: UIColor(named: "Blue")))
        signupWithFB.translatesAutoresizingMaskIntoConstraints = false
        return signupWithFB
    }()
    
    var orLabel: UILabel = {
        let orLabel = UILabel()
        orLabel.text = "or"
        orLabel.textAlignment = .center
        orLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        orLabel.textColor = .white
        orLabel.textAlignment = .center
        orLabel.numberOfLines = 0
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        return orLabel
    }()
    
    var signupWithEmail: CustomButton = {
        let signupWithEmail = CustomButton()

        signupWithEmail.configure(with: IconTextButtonViewModel(text: "Sign up with E-mail", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Grey50")))
        signupWithEmail.translatesAutoresizingMaskIntoConstraints = false
        return signupWithEmail
    }()
    
    var termsLabel: UILabel = {
        let termsLabel = UILabel()
        termsLabel.text = "By registering, you agree to our Terms of Use. Learn how we collect, use and share your data."
        termsLabel.textAlignment = .center
        termsLabel.font = .systemFont(ofSize: 14, weight: .medium)
        termsLabel.textColor = UIColor(named: "Grey50")
        termsLabel.textAlignment = .center
        termsLabel.numberOfLines = 0
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        return termsLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        addConstraints()
        addTargets()
    }
    
    func addViews() {
        view.backgroundColor = UIColor(named: "Grey80")
        view.addSubview(logoTitleView)
        view.addSubview(signupWithApple)
        view.addSubview(signupWithGoogle)
        view.addSubview(signupWithFB)
        view.addSubview(orLabel)
        view.addSubview(signupWithEmail)
        view.addSubview(termsLabel)
        
    }
    
    func addTargets() {
        signupWithEmail.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    
    @objc func navigate() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            logoTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 115),
            logoTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -99),
            logoTitleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            signupWithApple.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signupWithApple.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            signupWithApple.topAnchor.constraint(equalTo: logoTitleView.bottomAnchor, constant: 312),
            signupWithApple.heightAnchor.constraint(equalToConstant: 52),
            
            signupWithGoogle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signupWithGoogle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signupWithGoogle.topAnchor.constraint(equalTo: signupWithApple.bottomAnchor, constant: 16),
            signupWithGoogle.heightAnchor.constraint(equalToConstant: 52),
            
            signupWithFB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signupWithFB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signupWithFB.topAnchor.constraint(equalTo: signupWithGoogle.bottomAnchor, constant: 16),
            signupWithFB.heightAnchor.constraint(equalToConstant: 52),
            
            orLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            orLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            orLabel.topAnchor.constraint(equalTo: signupWithFB.bottomAnchor, constant: 40),
            
            signupWithEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signupWithEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signupWithEmail.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 40),
            signupWithEmail.heightAnchor.constraint(equalToConstant: 52),
            
            termsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            termsLabel.topAnchor.constraint(equalTo: signupWithEmail.bottomAnchor, constant: 24),
            termsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

