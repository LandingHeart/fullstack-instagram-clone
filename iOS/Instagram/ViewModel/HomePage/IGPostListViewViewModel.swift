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
            cellViewModels = posts.map({
                return IGPostCollectionViewCellViewModel(postImgUrl: $0.postImgUrl,
                                                         title: $0.title,
                                                         description: $0.description)
            })
        }
    }
    
    private var cellViewModels = [IGPostCollectionViewCellViewModel]()
    
    weak var delegate: IGPostListViewViewModelDelegate?
    
    //MARK: - Init
    override init() {
        super.init()
        fetchInitialPost()
    }
    
    private func fetchInitialPost() {
        IGService.shared.fetchAllPost { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.delegate?.didFetchInitialPost()
            case .failure(let error):
                //TODO: error handling
                print(error.localizedDescription)
            }
        }
    }
    private func fetchMorePost() {
        //TODO: Reqire Backend pagination of post model
    }
    
}


extension IGPostListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGPostCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? IGPostCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cellViewModel = cellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: K.screenWidth, height: K.screenHeight * 0.6)
    }
    
}
