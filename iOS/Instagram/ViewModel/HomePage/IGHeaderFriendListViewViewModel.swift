//
//  IGHeaderFriendListViewViewModel.swift
//  Instagram
//
//  Created by Huang Yan on 3/3/23.
//

import UIKit

final class IGHeaderFriendListViewViewModel: NSObject {
    
}

//MARK: - DataSource & Delegate
extension IGHeaderFriendListViewViewModel: UICollectionViewDelegate,
                                           UICollectionViewDataSource,
                                           UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGHeaderFriendListViewCell.cellIdentifier, for: indexPath) as? IGHeaderFriendListViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = collectionView.frame.height
        return CGSize(width: side, height: side)
    }
    
}
