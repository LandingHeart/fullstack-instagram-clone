//
//  PostCommentCell.swift
//  Instagram
//
//  Created by Huang Yan on 11/2/22.
//

import UIKit
class PostCommentCell: UITableViewCell {
    
    static let cellIdentifier = "PostDescripCell"
    
    let container = UIStackView()
    
    let poster = UIButton()
    
    let comment = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PostCommentCell.cellIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PostCommentCell {
    private func setup() {
        style()
        layout()
    }
    //MARK: - style
    private func style() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.spacing = 8
        container.alignment = .center
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.setTitle("Steven", for: .normal)
        poster.setTitleColor(.label, for: .normal)
        poster.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        comment.translatesAutoresizingMaskIntoConstraints = false
        comment.numberOfLines = 0
        comment.font = UIFont.preferredFont(forTextStyle: .body)
    }
    //MARK: - layout
    private func layout() {
        contentView.addSubview(container)
        container.addArrangedSubview(poster)
        container.addArrangedSubview(comment)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

    }
}
