//
//  OrSeparatorView.swift
//  Instagram
//
//  Created by Huang Yan on 1/8/23.
//

import UIKit
/// Separator in login screen that gives user options to login with third party auth
final class OrSeparatorView: UIView {
    
    let leftBar = SeparatorView()
    
    let orLabel = UILabel()
    
    let rightBar = SeparatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: 300, height: 30)
    }
}
extension OrSeparatorView {
    //MARK: - style
    private func style() {
        orLabel.textAlignment = .center
        orLabel.text = "OR"
        orLabel.font = UIFont.preferredFont(forTextStyle: .body)
        orLabel.contentMode = .scaleAspectFit
    }
    //MARK: - layout
    private func layout() {
        addSubview(leftBar)
        addSubview(orLabel)
        addSubview(rightBar)
        
        translatesAutoresizingMaskIntoConstraints = false
        leftBar.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        rightBar.translatesAutoresizingMaskIntoConstraints = false
        
        orLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate([
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            orLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            
            leftBar.heightAnchor.constraint(equalToConstant: 1),
            leftBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftBar.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            orLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leftBar.trailingAnchor, multiplier: 1),
            
            rightBar.heightAnchor.constraint(equalToConstant: 1),
            rightBar.leadingAnchor.constraint(equalToSystemSpacingAfter: orLabel.trailingAnchor, multiplier: 1),
            rightBar.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightBar.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
