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
    
    let phoneButton: SignupMethodButton = {
        let view = SignupMethodButton(title: "Phone")
        view.isSelected(true)
        return view
    }()
    
    let emailButton: SignupMethodButton = {
        let view = SignupMethodButton(title: "Email")
        view.isSelected(false)
        return view
    }()
    
    let emailField: LoginTextField = {
        let view = LoginTextField()
        view.configureTextField(placeholder: "Phone number")
        view.displayClearButton()
        return view
    }()
    
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
        emailField.delegate = self
    }
}
//MARK: - actions

extension SignupViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func didTapPhoneButton() {
        phoneButton.isSelected(true)
        emailButton.isSelected(false)
        emailField.configureTextField(placeholder: "Phone")
    }
    @objc func didTapEmailButton() {
        emailButton.isSelected(true)
        phoneButton.isSelected(false)
        emailField.configureTextField(placeholder: "Email")
    }
}

//MARK: - layout
extension SignupViewController {
    private func layout() {
        view.addSubviews(topLabel, buttonStack, emailField)
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
            
            emailField.centerXAnchor.constraint(equalTo: topLabel.centerXAnchor),
            emailField.topAnchor.constraint(equalToSystemSpacingBelow: buttonStack.bottomAnchor, multiplier: 2),
            emailField.widthAnchor.constraint(equalTo: topLabel.widthAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
//MARK: - TextField delegate
extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != "" {
            // try to login
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        emailField.displayClearButton()
    }
}
