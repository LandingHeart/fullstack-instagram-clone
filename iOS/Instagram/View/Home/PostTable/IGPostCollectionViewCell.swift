//
//  IGPostCollectionViewCell.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit


final class IGPostCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "IGPostCollectionViewCell"
    
    //Header
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
    
    //content
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //actions
    private lazy var likeButton: MainButton = {
        let button = MainButton(systemName: "heart", size: 30)
        return button
    }()
    
    private lazy var commentButton: MainButton = {
        let button = MainButton(systemName: "message", size: 27)
        return button
    }()
    
    private lazy var bookmarkButton: MainButton = {
        let button = MainButton(systemName: "bookmark", size: 27)
        return button
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " 831,245 likes"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: K.defaultFontSize, weight: .medium)
        return label
    }()
    
    private lazy var commentView: PostCommentView = {
        let commentView = PostCommentView()
        return commentView
    }()
    
    //Logic
    private var likesCount: Int = 0 {
        didSet {
            likesLabel.text = " \(likesCount) likes"
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func layout() {
        //spacers
        let leftSpacer = makeSpacer(width: 15, height: 60)
        let rightSpacer = makeSpacer(width: 20, height: 60)
        contentView.addSubviews(leftSpacer, rightSpacer)
        
        let actionButtonHeight: CGFloat = 40
        let actionButtonWidth: CGFloat = 40
        contentView.addSubviews(userIcon, usernameLabel, moreButton, imageView, likeButton,
                                commentButton, bookmarkButton,likesLabel, commentView)
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
            
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: userIcon.bottomAnchor, multiplier: 1),
            //Modify this constraint for dynamic height
            imageView.bottomAnchor.constraint(equalTo: likeButton.topAnchor),
            
            likeButton.heightAnchor.constraint(equalToConstant: actionButtonHeight),
            likeButton.widthAnchor.constraint(equalToConstant: actionButtonWidth),
            likeButton.leftAnchor.constraint(equalTo: userIcon.leftAnchor),
            likeButton.bottomAnchor.constraint(equalTo: likesLabel.topAnchor),
            
            commentButton.heightAnchor.constraint(equalToConstant: actionButtonHeight),
            commentButton.widthAnchor.constraint(equalToConstant: actionButtonWidth),
            commentButton.leftAnchor.constraint(equalToSystemSpacingAfter: likeButton.rightAnchor, multiplier: 1),
            commentButton.bottomAnchor.constraint(equalTo: likesLabel.topAnchor),
            
            bookmarkButton.heightAnchor.constraint(equalToConstant: actionButtonHeight),
            bookmarkButton.widthAnchor.constraint(equalToConstant: actionButtonWidth),
            bookmarkButton.rightAnchor.constraint(equalTo: moreButton.rightAnchor),
            bookmarkButton.bottomAnchor.constraint(equalTo: likesLabel.topAnchor),
            
            likesLabel.heightAnchor.constraint(equalToConstant: 25),
            likesLabel.leftAnchor.constraint(equalTo: userIcon.leftAnchor),
            likesLabel.rightAnchor.constraint(equalTo: moreButton.rightAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: commentView.topAnchor),
            
            commentView.leftAnchor.constraint(equalTo: userIcon.leftAnchor),
            commentView.rightAnchor.constraint(equalTo: moreButton.rightAnchor),
            commentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 45),
            commentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    override func prepareForReuse() {
//        userIcon.image = nil
//        usernameLabel.text = nil
//        imageView.image = nil
    }
    
    public func configure(with viewModel: IGPostCollectionViewCellViewModel) {
        self.commentView.comment = viewModel.description
        ImageSource.shared.downloadImage(url: viewModel.postImgUrl) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            case .failure(let error):
                print("Can not download Image: \(error.localizedDescription)")
            }
        }
    }
}
