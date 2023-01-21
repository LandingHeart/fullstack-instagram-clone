//
//  LoginViewController.swift
//  Instagram
//
//  Created by Huang Yan on 1/2/23.
//

import UIKit

protocol LoginDelegate: AnyObject {
    func didLogin(_ sender: LoginViewController)
}

final class LoginViewController: UIViewController {
    
    /// UIComponent
    let logo = UIImageView()
    
    let textStack = UIStackView()
    
    let usernameField = LoginTextField()
    
    let passwordField = LoginTextField(frame: CGRect(), secureMode: true)
    
    let forgotPassword = UIButton(type: .system)
    
    let signInButton = RoundButton()
    
    let orSeparator = OrSeparatorView()
    
    let loginOption = LoginOptionView()
    
    let footer = LoginFooterView(frame: CGRect(), labelText: "Don't have an account?", buttonText: "Sign Up")
    
    
    /// LoginComponent
    var username: String? {
        usernameField.text
    }
    var password: String? {
        passwordField.text
    }
    
    weak var delegate: LoginDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    //MARK: - Private function
    private func validInput() -> Bool {
        return !usernameField.isEmpty && !passwordField.isEmpty
    }
    
}
extension LoginViewController {
    //MARK: - setup
    private func setup() {
        usernameField.delegate = self
        passwordField.delegate = self
        signInButton.setTitle("Log in", for: [])
        signInButton.setTitleColor(.systemBackground, for: .disabled)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        footer.button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        configureSignInButton(enable: false)
    }
    //MARK: - style
    private func style() {
        textStack.axis = .vertical
        textStack.spacing = 6
        textStack.distribution = .fillEqually
        
        logo.image = UIImage(named: "Instagram")
        logo.contentMode = .scaleAspectFit
        
        usernameField.textField.placeholder = "Phone number, username or email"
        usernameField.textField.returnKeyType = .next
        usernameField.displayClearButton(false)
        
        passwordField.textField.placeholder = "Password"
        passwordField.textField.returnKeyType = .go
        
        forgotPassword.titleLabel?.font = UIFont.boldSystemFont(ofSize: K.defaultFontSize)
        forgotPassword.setTitle("Forgot Password?", for: .normal)
        
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        configureSignInButton(enable: validInput())
        usernameField.displayClearButton(!usernameField.isEmpty)
    }
    
}

//MARK: - Action
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func login() -> Bool {
        guard validInput() else {
            return false
        }
        return true
    }
    
    private func configureSignInButton(enable: Bool) {
        if enable {
            signInButton.isEnabled = true
            signInButton.backgroundColor = UIColor.systemBlue
        } else {
            signInButton.isEnabled = false
            signInButton.backgroundColor = UIColor.lightBlue
        }
    }
    //MARK: - objc
    @objc func didTapSignIn() {
        if login() {
            signInButton.isEnabled = true
            signInButton.configuration?.showsActivityIndicator = true
            signInButton.setTitle("", for: .normal)
            delegate?.didLogin(self)
        }
    }
    @objc func didTapSignUp() {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }
    
    //MARK: - layout
    private func layout() {
        view.addSubviews(textStack, logo)
        textStack.addArrangedSubviews(usernameField, passwordField)
        view.addSubviews(forgotPassword, signInButton, orSeparator, loginOption, footer)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        
        usernameField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        passwordField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.5),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: (K.screenHeight * 0.25)),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textStack.topAnchor.constraint(equalToSystemSpacingBelow: logo.bottomAnchor, multiplier: 3),
            textStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textStack.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.8),
            textStack.heightAnchor.constraint(equalToConstant: 100),
            
            forgotPassword.topAnchor.constraint(equalToSystemSpacingBelow: textStack.bottomAnchor, multiplier: 1),
            forgotPassword.trailingAnchor.constraint(equalTo: textStack.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: textStack.bottomAnchor, multiplier: 15),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: textStack.widthAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 47),
            
            orSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            /// set orSeparator's Y coordinate to defined by view's bottomAnchor to adapt different screens size. Otherwise it may goes out of screen or break layout consistancy.
            loginOption.topAnchor.constraint(equalToSystemSpacingBelow: orSeparator.bottomAnchor, multiplier: 1),
            orSeparator.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.75),
            orSeparator.heightAnchor.constraint(equalToConstant: 40),
            
            loginOption.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginOption.widthAnchor.constraint(equalToConstant: 130),
            loginOption.heightAnchor.constraint(equalToConstant: 50),
            footer.topAnchor.constraint(equalToSystemSpacingBelow: loginOption.bottomAnchor, multiplier: 2),
            
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: footer.topAnchor, multiplier: 12),
            footer.heightAnchor.constraint(equalToConstant: 96),
        ])
    }
}
