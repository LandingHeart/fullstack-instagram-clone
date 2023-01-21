//
//  SignupViewController.swift
//  Instagram
//
//  Created by Huang Yan on 1/17/23.
//

import UIKit

final class SignupViewController: UIViewController {
    
    /// UIComponents
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Phone or Email"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: K.defaultFontSize + 10, weight: .bold)
        return label
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    let phoneButton = SignupMethodButton(title: "Phone")
    
    let emailButton = SignupMethodButton(title: "Email")
    
    let usernameField: LoginTextField = {
        let view = LoginTextField()
        view.configureTextField(placeholder: "Phone number")
        view.displayClearButton(false)
        return view
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupNavBar()
        setupButton()
        setupDelegate()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didTapPhoneButton()
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
    }
    
    private func setupDelegate() {
        usernameField.delegate = self
    }
}
//MARK: - actions

extension SignupViewController {
    @objc func didTapPhoneButton() {
        phoneButton.isSelected(true)
        emailButton.isSelected(false)
    }
    @objc func didTapEmailButton() {
        emailButton.isSelected(true)
        phoneButton.isSelected(false)
    }
}

//MARK: - layout
extension SignupViewController {
    private func layout() {
        view.addSubviews(topLabel, buttonStack, usernameField)
        buttonStack.addArrangedSubviews(phoneButton, emailButton)
        
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            topLabel.widthAnchor.constraint(equalToConstant: K.screenWidth * 0.8),
            topLabel.heightAnchor.constraint(equalToConstant: 40),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            buttonStack.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
            buttonStack.heightAnchor.constraint(equalToConstant: 50),
            buttonStack.topAnchor.constraint(equalToSystemSpacingBelow: topLabel.bottomAnchor, multiplier: 1),
            
            usernameField.centerXAnchor.constraint(equalTo: topLabel.centerXAnchor),
            usernameField.topAnchor.constraint(equalToSystemSpacingBelow: buttonStack.bottomAnchor, multiplier: 2),
            usernameField.widthAnchor.constraint(equalTo: topLabel.widthAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
//MARK: - TextField delegate
extension SignupViewController: UITextFieldDelegate {
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        usernameField.displayClearButton(!usernameField.isEmpty)
    }
}
