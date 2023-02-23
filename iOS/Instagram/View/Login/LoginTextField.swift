//
//  LoginTextField.swift
//  Instagram
//
//  Created by Huang Yan on 1/4/23.
//

import UIKit

final class LoginTextField: UIView {
    
    /// UIComponent
    private let HStack = UIStackView()
    
    private let clearButton = UIButton()
    
    private let eyeButton = UIButton()
    
    let textField = UITextField()
    
    var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    /// Logic
    var isEmpty: Bool {
        return textField.text == ""
    }
    var text: String? {
        return textField.text
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        enableSecureMode(enable: false)
        style()
        layout()
    }
    init(frame: CGRect, secureMode: Bool = false) {
        super.init(frame: frame)
        setup()
        enableSecureMode(enable: secureMode)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Public function
    public func configureTextField(placeholder: String) {
        textField.placeholder = placeholder
    }
    
    public func displayClearButton() {
        clearButton.isHidden = isEmpty
    }
    
    public func enableSecureMode(enable input: Bool = true) {
        textField.isSecureTextEntry = input
        clearButton.isHidden = input
        eyeButton.isHidden = !input
    }
    
    //MARK: - Private function
    private func setup() {
        clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        clearButton.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        clearButton.tintColor = .label
        
        eyeButton.addTarget(self, action: #selector(toggleSecureMode), for: .touchUpInside)
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.tintColor = .label
    }
    
    //MARK: - Style
    private func style() {
        backgroundColor = .secondarySystemFill
        
        HStack.axis = .horizontal
        HStack.spacing = 8
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 60)
    }
    //MARK: - Layout
    private func layout() {
        addSubview(HStack)
        HStack.addArrangedSubview(textField)
        HStack.addArrangedSubview(clearButton)
        HStack.addArrangedSubview(eyeButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        HStack.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        clearButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        eyeButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate([
            HStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            HStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            textField.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 44),
            clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            eyeButton.widthAnchor.constraint(equalToConstant: 44),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    /// Override this function will make the View rounded
    override func layoutSubviews() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
//MARK: - Action
extension LoginTextField {
    @objc func toggleSecureMode() {
        let targetImage = eyeButton.imageView?.image == UIImage(systemName: "eye.fill") ? "eye.slash.fill" : "eye.fill"
        textField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: targetImage), for: .normal)
    }
    @objc func clearTextField() {
        textField.text = ""
        textField.delegate?.textFieldDidChangeSelection?(textField)
    }
}
