//
//  IGPostListView.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit

class IGPostListView: UIView {
    
    private let viewModel = IGPostListViewViewModel()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 10, left: 0, bottom: 10, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(IGPostCollectionViewCell.self,
                                forCellWithReuseIdentifier: IGPostCollectionViewCell.cellIdentifier)
        collectionView.register(IGPostHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: IGPostHeaderCollectionReusableView.reuseIdentifier)
        collectionView.alpha = 0
        return collectionView
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layout()
        setupCollectionView()
        spinner.startAnimating()
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func layout() {
        addSubviews(spinner, collectionView)
        
        collectionView.pin(to: self)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    
    private func showCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) { [weak self] in
            self?.spinner.stopAnimating()
            UIView.animate(withDuration: 1) {
                self?.collectionView.alpha = 1
            }
            self?.collectionView.reloadData()
        }
    }
}

extension IGPostListView: IGPostListViewViewModelDelegate {
    
    func didFetchInitialPost() {
        showCollectionView()
    }
    
}
