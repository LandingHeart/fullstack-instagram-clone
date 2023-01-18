//
//  SignupMethodButton.swift
//  Instagram
//
//  Created by Huang Yan on 1/18/23.
//

import UIKit

/// Signup button that has a underliine with a plain view
final class SignupMethodButton: UIButton {
    
    /// indicator of selected state
    private let underline = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(title: String) {
        super.init(frame: CGRect())
        style()
        setTitle(title, for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: 60, height: 60)
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(UIColor.label, for: .normal)
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: K.defaultFontSize + 7, weight: .bold)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUnderline()
        addBorder(side: .buttom)
    }
    private func setupUnderline() {
        underline.frame = CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: 1)
        underline.backgroundColor = UIColor.label.cgColor
        layer.addSublayer(underline)
    }
    //MARK: - Public
    public func isSelected(_ input: Bool) {
        underline.isHidden = !input
    }
}
