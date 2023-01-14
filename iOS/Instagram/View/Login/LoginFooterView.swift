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
        
        configureTopBorder()
    }
    
    //MARK: - layout
    private func layout() {
        addSubview(HStack)
        HStack.addArrangedSubview(label)
        HStack.addArrangedSubview(button)
        
        HStack.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            HStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            HStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    private func configureTopBorder() {
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: K.screenWidth, height: 0.5)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(topBorder)
    }
}
