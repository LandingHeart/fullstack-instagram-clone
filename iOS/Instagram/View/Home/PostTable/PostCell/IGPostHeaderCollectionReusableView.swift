//
//  IGPostHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Huang Yan on 3/2/23.
//

import UIKit

final class IGPostHeaderCollectionReusableView: UICollectionReusableView {
    
    let friendListView = IGHeaderFriendListView()
        
    static let reuseIdentifier = "IGPostHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func layout() {
        addSubviews(friendListView)
        
        friendListView.pin(to: self)
    }
}
