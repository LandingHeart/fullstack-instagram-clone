//
//  LoginFooterView.swift
//  Instagram
//
//  Created by Huang Yan on 1/14/23.
//

import UIKit
final class LoginFooterView: UIView {
    
    let HStack = UIStackView()
    
    let button = UIButton(type: .system)
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    public init(frame: CGRect, labelText: String, buttonText: String) {
        super.init(frame: frame)
        style()
        layout()
        setText(labelText: labelText, buttonText: buttonText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: K.screenWidth, height: 100)
    }
    
    private func setText(labelText: String, buttonText: String) {
        label.text = labelText
        button.setTitle(buttonText, for: .normal)
    }
}

extension LoginFooterView {
    //MARK: - style
    private func style() {
        HStack.axis = .horizontal
        HStack.spacing = 8
        
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: K.defaultFontSize, weight: .bold)
        
    }
    
    //MARK: - layout
    private func layout() {
        addSubview(HStack)
        HStack.addArrangedSubview(label)
        HStack.addArrangedSubview(button)
        
        translatesAutoresizingMaskIntoConstraints = false
        HStack.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            HStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            HStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBorder(side: .top, borderWidth: 0.5, borderColor: .lightGray)
    }
}
