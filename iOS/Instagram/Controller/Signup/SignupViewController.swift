//
//  SignupViewController.swift
//  Instagram
//
//  Created by Huang Yan on 1/17/23.
//

import UIKit

final class SignupViewController: UIViewController {
    
    /// UIComponents
    private let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Phone or Email"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: K.defaultFontSize + 10, weight: .bold)
        return label
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let phoneButton: SignupMethodButton = {
        let view = SignupMethodButton(title: "Phone")
        view.isSelected(true)
        return view
    }()
    
    private let emailButton: SignupMethodButton = {
        let view = SignupMethodButton(title: "Email")
        view.isSelected(false)
        return view
    }()
    
    private let usernameField: LoginTextField = {
        let view = LoginTextField()
        view.configureTextField(placeholder: "username")
        view.textField.keyboardType = .emailAddress
        view.displayClearButton()
        return view
    }()
    
    private let emailField: LoginTextField = {
        let view = LoginTextField()
        view.configureTextField(placeholder: "Email address")
        view.textField.keyboardType = .emailAddress
        view.displayClearButton()
        return view
    }()
    
    private let passwordField: LoginTextField = {
        let view = LoginTextField(frame: CGRect(), secureMode: true)
        view.textField.textContentType = .password
        view.configureTextField(placeholder: "Password")
        view.textField.returnKeyType = .go
        view.textField.keyboardType = .default
        return view
    }()
    
    private let signupButton: RoundButton = {
        let button = RoundButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .lightBlue
        button.isEnabled = false
        return button
    }()
    
    private let footer: LoginFooterView = {
        let footer = LoginFooterView(frame: .zero, labelText: "Already have account?", buttonText: "Log In")
        return footer
    }()
    // computed properties
    private var validInput: Bool {
        return !emailField.isEmpty && !passwordField.isEmpty
    }
    
    private var email: String? {
        emailField.text
    }
    private var username: String? {
        usernameField.text
    }
    private var password: String? {
        passwordField.text
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
        setupNavBar()
        setupButton()
        setupDelegate()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didTapEmailButton()
        emailField.textField.becomeFirstResponder()
    }
    //MARK: - Public function
    
    
    
    //MARK: - Private function
    private func setupNavBar() {
        navigationController?.setBackbuttonTitle("")
        setNavBarTintColor(UIColor.label)
    }
    
    private func setupButton() {
        phoneButton.addTarget(self, action: #selector(didTapPhoneButton), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(didTapEmailButton), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        footer.button.addTarget(self, action: #selector(didTapeLogin), for: .touchUpInside)
    }
    
    private func setupDelegate() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    private func configureButton() {
        signupButton.isEnabled = validInput
        signupButton.backgroundColor = validInput ? .systemBlue : .lightBlue
    }
}
//MARK: - actions
extension SignupViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailField.endEditing(true)
    }
    @objc
    func didTapPhoneButton() {
        phoneButton.isSelected(true)
        emailButton.isSelected(false)
        emailField.configureTextField(placeholder: "Phone number")
    }
    @objc
    func didTapEmailButton() {
        emailButton.isSelected(true)
        phoneButton.isSelected(false)
        emailField.configureTextField(placeholder: "Email address")
    }
    @objc
    func didTapSignup() {
        guard let email = email, let username = username, let password = password else { return }
        IGService.shared.register(email: email, username: username, password: password) { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                IGErrorMessageView.customized(message: "User Already Exist")
                print(error.localizedDescription)
            }
        }
    }
    @objc
    func didTapeLogin() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - layout
extension SignupViewController {
    private func layout() {
        view.addSubviews(topLabel, buttonStack, emailField, usernameField, passwordField, signupButton, footer)
        buttonStack.addArrangedSubviews(emailButton, phoneButton)
        
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            topLabel.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.8),
            topLabel.heightAnchor.constraint(equalToConstant: 40),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            buttonStack.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
            buttonStack.heightAnchor.constraint(equalToConstant: 50),
            buttonStack.topAnchor.constraint(equalToSystemSpacingBelow: topLabel.bottomAnchor, multiplier: 1),
            
            emailField.centerXAnchor.constraint(equalTo: topLabel.centerXAnchor),
            emailField.topAnchor.constraint(equalToSystemSpacingBelow: buttonStack.bottomAnchor, multiplier: 2),
            emailField.widthAnchor.constraint(equalTo: topLabel.widthAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            usernameField.centerXAnchor.constraint(equalTo: topLabel.centerXAnchor),
            usernameField.topAnchor.constraint(equalToSystemSpacingBelow: emailField.bottomAnchor, multiplier: 2),
            usernameField.widthAnchor.constraint(equalTo: topLabel.widthAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.centerXAnchor.constraint(equalTo: topLabel.centerXAnchor),
            passwordField.topAnchor.constraint(equalToSystemSpacingBelow: usernameField.bottomAnchor, multiplier: 2),
            passwordField.widthAnchor.constraint(equalTo: emailField.widthAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            signupButton.centerXAnchor.constraint(equalTo: topLabel.centerXAnchor),
            signupButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordField.bottomAnchor, multiplier: 4),
            signupButton.widthAnchor.constraint(equalTo: emailField.widthAnchor),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
            
            footer.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            footer.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            footer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footer.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
//MARK: - TextField delegate
extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        configureButton()
        emailField.displayClearButton()
    }
}
