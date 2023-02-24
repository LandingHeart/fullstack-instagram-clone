//
//  IGPostCollectionViewCell.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit

final class IGPostCollectionViewCell: UICollectionViewCell {
    
    
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
        
    }
    
    public func configure(with viewModel: IGPostCollectionViewCellViewModel) {
        
    }
}
