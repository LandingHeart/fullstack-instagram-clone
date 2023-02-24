//
//  IGPostListViewViewModel.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit

protocol IGPostListViewViewModelDelegate: AnyObject {
    func didFetchInitialPost()
}
final class IGPostListViewViewModel: NSObject {
    
    private var posts = [IGPost]() {
        didSet {
            
        }
    }
    
    private var cellViewModels = [IGPostCollectionViewCellViewModel]()
    
    weak var delegate: IGPostListViewViewModel?
    
    //MARK: - Init
    override init() {
        super.init()
        fetchInitialPost()
    }
    
    private func fetchInitialPost() {
        
    }
    private func fetchMorePost() {
        //TODO: Reqire Backend pagination of post model
    }
    
}


extension IGPostListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: K.screenWidth, height: K.screenHeight * 0.5)
    }
    
}
