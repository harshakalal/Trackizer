//
//  SignUpViewController.swift
//  Trackizer
//
//  Created by Harsha AM on 20/06/23.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
//    var logoTitleView: LogoTitleView = {
//        let logoTitleView = LogoTitleView()
//        logoTitleView.translatesAutoresizingMaskIntoConstraints = false
//        return logoTitleView
//    }()
    
    var logoTitleView: UILabel = {
        let logoTitleView = UILabel()
        logoTitleView.text = "Sign Up"
        logoTitleView.font = .systemFont(ofSize: 32, weight: .bold)
        logoTitleView.translatesAutoresizingMaskIntoConstraints = false
        logoTitleView.textColor = UIColor(named: "Grey50")
        return logoTitleView
    }()
    
    var emailTextfield: CustomTextField = {
        let emailTextfield = CustomTextField()
        emailTextfield.configure(with: CustomButtonTextModel(labelText: "E-mail address"))
        emailTextfield.translatesAutoresizingMaskIntoConstraints = false
        return emailTextfield
    }()
    
    var passwordTextfield: CustomTextField = {
        let passwordTextfield = CustomTextField()
        passwordTextfield.configure(with: CustomButtonTextModel(labelText: "Password"))
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextfield
    }()
    
//    var passwordStrongDetectorStack: UIStackView = {
//        let passwordStrongDetectorStack = UIStackView()
//        passwordStrongDetectorStack.axis = .horizontal
//        passwordStrongDetectorStack.spacing = 3
//        passwordStrongDetectorStack.translatesAutoresizingMaskIntoConstraints = false
//        return passwordStrongDetectorStack
//    }()
    
    var lineView: LineView = {
        let redView = LineView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    var passwordStrongCount: Int = 0
    
    var passwordTermsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "Grey50")
        label.text = "Use 8 or more characters with a mix of letters, numbers & symbols."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var signupBtn: CustomButton = {
        let signupBtn = CustomButton()

        signupBtn.configure(with: IconTextButtonViewModel(text: "Get started, It's free.", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Orange")))
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        return signupBtn
    }()
    
    var signInBtn: CustomButton = {
        let signInBtn = CustomButton()

        signInBtn.configure(with: IconTextButtonViewModel(text: "Sign In", textColor: .white, iconImage: nil, backgroundColor: UIColor(named: "Grey50")))
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        return signInBtn
    }()
    
    var haveAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "Grey50")
        label.text = "Do you have already an account?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    var detectorView: [UIView] = []
    var frameSize = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.textfield.delegate = self
        addViews()
        addContraints()
        addPasswordDetectorViews()
        addTargets()
    }

    func addViews() {
//        detectorView = [redView, yellowView, blueView, greenView]
        view.backgroundColor = UIColor(named: "Grey80")
        view.addSubview(logoTitleView)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(lineView)
//        view.addSubview(passwordStrongDetectorStack)
        view.addSubview(passwordTermsLabel)
        view.addSubview(signupBtn)
        view.addSubview(signInBtn)
        view.addSubview(haveAccountLabel)
    }
    
    func addTargets() {
        signupBtn.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    
    @objc func navigate() {
        navigationController?.pushViewController(CustomTabBarViewController(), animated: true)
    }
    
    func addPasswordDetectorViews() {
//        for view in detectorView {
//            view.backgroundColor = UIColor(named: "Grey50")
//            view.translatesAutoresizingMaskIntoConstraints = false
//            passwordStrongDetectorStack.addArrangedSubview(view)
//
//            NSLayoutConstraint.activate([
//                view.widthAnchor.constraint(equalToConstant: (frameSize - 40) / 4),
//                view.heightAnchor.constraint(equalToConstant: 5)
//            ])
//        }
        
    }
    
    func addContraints() {
        NSLayoutConstraint.activate([
//            logoTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 115),
//            logoTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -99),
            logoTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoTitleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            emailTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextfield.topAnchor.constraint(equalTo: logoTitleView.bottomAnchor, constant: 100),
            
            passwordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 16),
            
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lineView.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 24),
            lineView.widthAnchor.constraint(equalToConstant: 79),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            
            passwordTermsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTermsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTermsLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            
            signupBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signupBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signupBtn.topAnchor.constraint(equalTo: passwordTermsLabel.bottomAnchor, constant: 40),
            signupBtn.heightAnchor.constraint(equalToConstant: 52),
            
            haveAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            haveAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            haveAccountLabel.bottomAnchor.constraint(equalTo: signInBtn.topAnchor, constant: -16),
            
            signInBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            signInBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
        frameSize = view.frame.size.width
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordTextfield.textfield {
            guard let passwordStrongnessChecker = textField.text else { return
            }
            let passwordCheckerCount = getCounts(password: passwordStrongnessChecker)
            displayStrongness(passwordCheckerCount: passwordCheckerCount)
            
        }
    }
    
    func getCounts(password: String) -> Int {
        var smallCount = 0
        var capitalCount = 0
        var specialCount = 0
        var numberCount = 0
        
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()_-+=<>?/,....:;{}[]~")
        
        for char in password {
            let charString = String(char)
            let characterSet = CharacterSet(charactersIn: charString)
            
            if CharacterSet.lowercaseLetters.isSuperset(of: characterSet) {
                smallCount = 1
            }
            
            if CharacterSet.uppercaseLetters.isSuperset(of: characterSet) {
                capitalCount = 1
            }
            
            if specialCharacterSet.isSuperset(of: characterSet) {
                specialCount = 1
            }
            
            if CharacterSet.decimalDigits.isSuperset(of: characterSet) {
                numberCount = 1
            }
        }
        
        return (smallCount + capitalCount + specialCount + numberCount)
    }
    
    func displayStrongness(passwordCheckerCount: Int) {
        var color = UIColor()
        if passwordStrongCount != passwordCheckerCount {
            if passwordCheckerCount == 1 {
                color = .systemRed
                configurePasswordStrongnessView(passwordCheckerCount: passwordCheckerCount, color: color)
            } else if passwordCheckerCount == 2 {
                color = .systemYellow
                configurePasswordStrongnessView(passwordCheckerCount: passwordCheckerCount, color: color)
            } else if passwordCheckerCount == 3 {
                color = .systemBlue
                configurePasswordStrongnessView(passwordCheckerCount: passwordCheckerCount, color: color)
            } else if passwordCheckerCount == 4{
                color = .systemGreen
                configurePasswordStrongnessView(passwordCheckerCount: passwordCheckerCount, color: color)
            } else {
                color = UIColor(named: "Grey50") ?? .white
                configurePasswordStrongnessView(passwordCheckerCount: 0, color: color)
            }
        }
    }
    
    func configurePasswordStrongnessView(passwordCheckerCount: Int, color: UIColor) {
        if passwordCheckerCount >= passwordStrongCount {
            passwordStrongCount = passwordCheckerCount
            passWordValidator(count: passwordCheckerCount, color: color, fillMode: .forwards)
        } else {
            passwordStrongCount = passwordCheckerCount
            passWordValidator(count: passwordCheckerCount, color: color, fillMode: .backwards)
        }
    }
    
    
    
    func passWordValidator(count: Int, color: UIColor, fillMode: CAMediaTimingFillMode) {
        
        let fromValueForward = 0.20 * CGFloat(count - 1)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0.20 * CGFloat(count)
        animation.duration = 0.25
        animation.isRemovedOnCompletion = false
        animation.fillMode = fillMode
        if fillMode == .backwards {
            animation.fromValue = 0.20 * CGFloat(count + 1)
            animation.toValue = 0.20 * CGFloat(count + 1) - 0.20
            lineView.shape.strokeEnd = CGFloat(count) * 0.20
        } else {
            animation.fromValue = fromValueForward
            animation.toValue = 0.20 * CGFloat(count)
        }
        lineView.shape.strokeColor = color.cgColor
        lineView.shape.add(animation, forKey: "animation")
    }

}


