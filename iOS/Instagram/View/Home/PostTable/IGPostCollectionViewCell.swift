//
//  IGPostCollectionViewCell.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit

final class IGPostCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "IGPostCollectionViewCell"
    
    private let userIcon: ProfileImageView = {
        let userIcon = ProfileImageView()
        userIcon.image = UIImage(named: "icon")
        return userIcon
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: K.defaultFontSize, weight: .medium)
        label.text = "Steven"
        label.textColor = .label
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func layout() {
        //spacers
        let leftSpacer = makeSpacer(width: 20, height: 60)
        let rightSpacer = makeSpacer(width: 20, height: 60)
        contentView.addSubviews(leftSpacer, rightSpacer)
        
        contentView.addSubviews(userIcon, usernameLabel, moreButton)
        
        NSLayoutConstraint.activate([
            userIcon.widthAnchor.constraint(equalToConstant: 60),
            userIcon.heightAnchor.constraint(equalToConstant: 60),
            leftSpacer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            leftSpacer.topAnchor.constraint(equalTo: contentView.topAnchor),
            userIcon.leftAnchor.constraint(equalTo: leftSpacer.rightAnchor),
            userIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            usernameLabel.centerYAnchor.constraint(equalTo: userIcon.centerYAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 60),
            usernameLabel.leftAnchor.constraint(equalToSystemSpacingAfter: userIcon.rightAnchor, multiplier: 1.5),
            usernameLabel.rightAnchor.constraint(equalTo: moreButton.leftAnchor),
            
            moreButton.widthAnchor.constraint(equalToConstant: 40),
            moreButton.heightAnchor.constraint(equalToConstant: 40),
            rightSpacer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            rightSpacer.topAnchor.constraint(equalTo: contentView.topAnchor),
            moreButton.centerYAnchor.constraint(equalTo: userIcon.centerYAnchor),
            moreButton.rightAnchor.constraint(equalTo: rightSpacer.leftAnchor),

        ])
    }
    
    public func configure(with viewModel: IGPostCollectionViewCellViewModel) {
        
    }
}
