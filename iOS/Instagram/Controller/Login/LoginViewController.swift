//
//  LoginViewController.swift
//  Instagram
//
//  Created by Huang Yan on 1/2/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    let logo = UIImageView()
    
    let textStack = UIStackView()

    let usernameField = LoginTextField()
    
    let passwordField = LoginTextField(frame: CGRect(), secureMode: true)
    
    let errorPrompt = UILabel()
    
    let signInButton = RoundButton()
    
    var username: String? {
        usernameField.textField.text
    }
    var password: String? {
        passwordField.textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
}
//MARK: - Setup & Style * layout
extension LoginViewController {
    private func setup() {
        usernameField.delegate = self
        passwordField.delegate = self
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    private func style() {
        textStack.axis = .vertical
        textStack.spacing = 6
        textStack.distribution = .fillEqually
        
        logo.image = UIImage(named: "Instagram")
        logo.contentMode = .scaleAspectFit
        
        usernameField.textField.placeholder = "Phone number, username or email"
        usernameField.textField.returnKeyType = .next
        
        passwordField.textField.placeholder = "Password"
        passwordField.textField.returnKeyType = .go
        
        errorPrompt.textColor = .systemRed
        errorPrompt.isHidden = true
        errorPrompt.numberOfLines = 0
        
    }
    private func layout() {
        view.addSubview(textStack)
        view.addSubview(logo)
        textStack.addArrangedSubview(usernameField)
        textStack.addArrangedSubview(passwordField)
        view.addSubview(errorPrompt)
        view.addSubview(signInButton)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        errorPrompt.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        usernameField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        passwordField.setContentHuggingPriority(.defaultHigh, for: .vertical)

        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.5),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: (K.screenHeight * 0.25)),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textStack.topAnchor.constraint(equalToSystemSpacingBelow: logo.bottomAnchor, multiplier: 3),
            textStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textStack.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.9),
            textStack.heightAnchor.constraint(equalToConstant: 100),
            
            errorPrompt.topAnchor.constraint(equalToSystemSpacingBelow: textStack.bottomAnchor, multiplier: 1),
            errorPrompt.leadingAnchor.constraint(equalToSystemSpacingAfter: textStack.leadingAnchor, multiplier: 1),
            errorPrompt.trailingAnchor.constraint(equalTo: textStack.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: textStack.bottomAnchor, multiplier: 6),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: textStack.widthAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 47),
        ])
    }
    
}

//MARK: - TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != "" {
            // try to login
        }
        return true
    }
}

//MARK: - Action
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func didTapSignIn() {
        if login() {
            signInButton.isEnabled = true
            signInButton.configuration?.showsActivityIndicator = true
            signInButton.setTitle("", for: .normal)
        }
    }
    
    private func login() -> Bool {
        guard username != "", password != "" else {
            configureErrorPrompt("Username or Password can not be blank")
            return false
        }
        return true
    }
    
    private func configureErrorPrompt(_ text: String) {
        errorPrompt.isHidden = false
        errorPrompt.text = text
    }
    
}
