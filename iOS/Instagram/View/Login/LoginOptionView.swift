//
//  LoginOptionView.swift
//  Instagram
//
//  Created by Huang Yan on 1/15/23.
//

import UIKit
final class LoginOptionView: UIView {
    
    let HStack = UIStackView()
    
    let google = UIButton()
    
    let facebook = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginOptionView {
    private func setupButton() {
        google.setImage(UIImage(named: "google"), for: .normal)
        facebook.setImage(UIImage(named: "facebook"), for: .normal)
    }
    
    //MARK: - style
    private func style() {
        HStack.axis = .horizontal
        HStack.spacing = 30
        HStack.distribution = .fillEqually
        
        google.contentMode = .scaleAspectFit
        
        facebook.contentMode = .scaleAspectFit
        
    }
    
    //MARK: - layout
    private func layout() {
        addSubview(HStack)
        HStack.addArrangedSubview(google)
        HStack.addArrangedSubview(facebook)
        
        HStack.translatesAutoresizingMaskIntoConstraints = false
        google.translatesAutoresizingMaskIntoConstraints = false
        facebook.translatesAutoresizingMaskIntoConstraints = false
        
        HStack.pin(to: self)
        
//        google.makeSquare(sideLength: 50)
//        facebook.makeSquare(sideLength: 50)
        
    }
}
