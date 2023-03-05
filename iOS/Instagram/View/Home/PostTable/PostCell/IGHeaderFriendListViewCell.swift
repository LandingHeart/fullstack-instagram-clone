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
    
    public func configure(with viewModel: IGHeaderFriendListViewCellViewModel) {
        ImageSource.shared.downloadImage(url: URL(string: viewModel.imageUrl)) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.friendIcon.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
