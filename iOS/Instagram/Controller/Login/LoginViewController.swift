//
//  LoginViewController.swift
//  Instagram
//
//  Created by Huang Yan on 1/2/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    let logo = UIImageView()
    
    let VStack = UIStackView()

    let emailField = LoginTextField()
    
    let passwordField = LoginTextField(frame: CGRect(), secureMode: true)
    
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
        emailField.delegate = self
        passwordField.delegate = self
    }
    private func style() {
        VStack.axis = .vertical
        VStack.spacing = 6
        VStack.distribution = .fillEqually
        
        logo.image = UIImage(named: "Instagram")
        logo.contentMode = .scaleAspectFit
        
        emailField.textField.placeholder = "Phone number, username or email"
        emailField.textField.returnKeyType = .next
        
        
        passwordField.textField.placeholder = "Password"
        passwordField.textField.returnKeyType = .go
        
    }
    private func layout() {
        view.addSubview(VStack)
        view.addSubview(logo)
        VStack.addArrangedSubview(emailField)
        VStack.addArrangedSubview(passwordField)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        VStack.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        passwordField.setContentHuggingPriority(.defaultHigh, for: .vertical)

        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.5),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: (K.screenHeight * 0.25)),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            VStack.topAnchor.constraint(equalToSystemSpacingBelow: logo.bottomAnchor, multiplier: 3),
            VStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            VStack.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.9),
            VStack.heightAnchor.constraint(equalToConstant: 100),
            
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
}
