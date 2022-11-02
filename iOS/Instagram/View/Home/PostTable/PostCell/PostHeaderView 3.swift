//
//  PostHeaderView.swift
//  Instagram
//
//  Created by Huang Yan on 10/20/22.
//


import UIKit

class PostHeaderView: UIView {
    
    let HStack = UIStackView()
    
    let userIcon = ProfileImageView(frame: CGRect())
    
    let userNameLabel = UILabel()
    
    var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostHeaderView {
    func style() {
        //stack
        HStack.translatesAutoresizingMaskIntoConstraints = false
        HStack.spacing = 16
        HStack.axis = .horizontal
        //icon
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.contentMode = .scaleAspectFill
        userIcon.image = UIImage(named: "icon")
        //nameLabel
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        userNameLabel.text = "Steven"
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        let trailingGuide = UILayoutGuide()
        let leadingGuide = UILayoutGuide()
        addLayoutGuide(trailingGuide)
        addLayoutGuide(leadingGuide)
        addSubview(HStack)
        HStack.addArrangedSubview(userIcon)
        HStack.addArrangedSubview(userNameLabel)
        HStack.addArrangedSubview(moreButton)
        
        NSLayoutConstraint.activate([
            userIcon.heightAnchor.constraint(equalToConstant: 56),
            userIcon.widthAnchor.constraint(equalToConstant: 56),
//            moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            trailingGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            moreButton.trailingAnchor.constraint(equalTo: trailingGuide.trailingAnchor),
            leadingGuide.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            userIcon.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor),
            
            moreButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
}
