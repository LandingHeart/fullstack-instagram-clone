//
//  IGHeaderFriendListViewCell.swift
//  Instagram
//
//  Created by Huang Yan on 3/3/23.
//

import UIKit

class IGHeaderFriendListViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "IGHeaderFriendListViewCell"
    
    private let friendIcon: ProfileImageView = {
        let profileImageView = ProfileImageView()
        return profileImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        friendIcon.image = UIImage(named: "icon")
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Layout
    private func layout() {
        addSubview(friendIcon)
        
        NSLayoutConstraint.activate([
            friendIcon.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            friendIcon.heightAnchor.constraint(equalToConstant: contentView.frame.height),
        ])
    }
}
