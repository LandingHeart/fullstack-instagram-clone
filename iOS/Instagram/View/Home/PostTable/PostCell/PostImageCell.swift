//
//  PostImageCell.swift
//  Instagram
//
//  Created by Huang Yan on 10/20/22.
//

import UIKit

class PostImageCell: UITableViewCell {
    
    var images = UIImageView()
    
    var loadedImages: UIImage? {
        didSet {
            images.image = loadedImages
        }
    }
    
    var onReuse: () -> Void = {}
    
    static let cellIdentifier = "PostCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PostImageCell.cellIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setting up cell
    private func setup() {
        style()
        layout()
    }
}
//MARK: - style
extension PostImageCell {
    private func style() {
        images.translatesAutoresizingMaskIntoConstraints = false
        images.contentMode = .scaleAspectFill
    }
}
//MARK: - layout
extension PostImageCell {
    private func layout() {
        contentView.addSubview(images)
        NSLayoutConstraint.activate([
            images.topAnchor.constraint(equalTo: contentView.topAnchor),
            images.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            images.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            images.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        onReuse()
        images.image = nil
    }
}
