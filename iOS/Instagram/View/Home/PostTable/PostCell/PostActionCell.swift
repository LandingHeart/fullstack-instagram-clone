//
//  PostActionCell.swift
//  Instagram
//
//  Created by Huang Yan on 11/2/22.
//

import UIKit
class PostActionCell: UITableViewCell {
    
    static let cellIdentifier = "PostActionCell"
    
    let container = UIStackView()
    
    let likeLabel = UILabel()
    
    let HStack = UIStackView()
    
    
    let likeButton = MainButton(systemName: "heart", size: 30)
    
    let commentButton = MainButton(systemName: "message", size: 27)
    
    let bookmarkButton = MainButton(systemName: "bookmark", size: 27)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PostActionCell.cellIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PostActionCell {
    private func setup() {
        style()
        layout()
    }
    //MARK: - style
    private func style() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.spacing = 12
        container.axis = .vertical
        container.alignment = .leading
        
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        likeLabel.text = "929 Likes"
        
        HStack.translatesAutoresizingMaskIntoConstraints = false
        HStack.spacing = 16
        HStack.axis = .horizontal
        HStack.alignment = .center
        
    }
    //MARK: - layout
    private func layout() {
        contentView.addSubview(container)
        container.addArrangedSubview(HStack)
        container.addArrangedSubview(likeLabel)
        HStack.addArrangedSubview(likeButton)
        HStack.addArrangedSubview(commentButton)
        let spacer = UIView()
        HStack.addArrangedSubview(spacer)
        HStack.addArrangedSubview(bookmarkButton)
        spacer.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal) // great for space out the view
        
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            container.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bookmarkButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 50),
            
        ])

    }
}
