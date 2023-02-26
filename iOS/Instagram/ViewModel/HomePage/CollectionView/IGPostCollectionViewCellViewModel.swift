//
//  IGPostCollectionViewCellViewModel.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import Foundation

final class IGPostCollectionViewCellViewModel {
    
//    let userIconURL: String
    
//    let username: String
    
    public let postImgUrl: URL?
    
    public let title: String
    
    public let description: String
    
    public let imageAspectRatio: Double
    
//    public let likes: Int
    
    init (postImgUrl: String, title: String, description: String, imageAspectRatio: Double) {
        self.postImgUrl = URL(string: postImgUrl)
        self.title = title
        self.description = description
        self.imageAspectRatio = imageAspectRatio
    }
    
}
