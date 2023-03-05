//
//  IGHeaderFriendListViewViewModel.swift
//  Instagram
//
//  Created by Huang Yan on 3/3/23.
//

import UIKit

final class IGHeaderFriendListViewViewModel: NSObject {
    
    
    private var cellViewModels: [IGHeaderFriendListViewCellViewModel] = [.init(imageUrl: "https://dk2dv4ezy246u.cloudfront.net/widgets/sSEDTwRiphS1_large.jpg"),
                                                                         .init(imageUrl: "https://yaffa-cdn.s3.amazonaws.com/yaffadsp/images/dmImage/StandardImage/p3-hd.jpg"),
                                                                         .init(imageUrl: "https://play-lh.googleusercontent.com/7Ac5TgaL15Ra4bvFVHJKCdJp4qvnL4djZj5bKc6RN-MZjzrvkeHbJytek0NPTSdZcp8"),
                                                                         .init(imageUrl: "https://i.pinimg.com/originals/10/91/94/1091948c6b80b65b9eef8c163f0ae42a.jpg"),
                                                                         .init(imageUrl: "https://i1.sndcdn.com/avatars-000655118672-xb0aun-t500x500.jpg")]
}

//MARK: - DataSource & Delegate
extension IGHeaderFriendListViewViewModel: UICollectionViewDelegate,
                                           UICollectionViewDataSource,
                                           UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGHeaderFriendListViewCell.cellIdentifier, for: indexPath) as? IGHeaderFriendListViewCell else {
            return UICollectionViewCell()
        }
        
        let cellViewModel = cellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = collectionView.frame.height
        return CGSize(width: side, height: side)
    }
    
}
