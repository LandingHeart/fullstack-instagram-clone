//
//  IGHeaderFriendListView.swift
//  Instagram
//
//  Created by Huang Yan on 3/3/23.
//

import UIKit

final class IGHeaderFriendListView: UIView {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 5, bottom: 0, right: 5)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(IGHeaderFriendListViewCell.self, forCellWithReuseIdentifier: IGHeaderFriendListViewCell.cellIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let viewModel = IGHeaderFriendListViewViewModel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Layout
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView)
        
        collectionView.pin(to: self)
    }
}
