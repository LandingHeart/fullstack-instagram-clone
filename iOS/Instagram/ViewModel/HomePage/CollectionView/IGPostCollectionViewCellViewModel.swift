//
//  IGPostCollectionViewCellViewModel.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit

final class IGPostCollectionViewCellViewModel {
    
//    let userIconURL: String
    
//    let username: String
    
    public let postImgUrl: URL?
    
    public let title: String
    
    public let description: String
    
    public let imageAspectRatio: Double
    
//    public let likes: Int
    
    //logic
    public var cellHeight: CGFloat {
        let headerHeight = 68.0, actionHeight = 40.0, likesHeight = 25.0, commentHeight = 45.0
        var requiredHeight = headerHeight + actionHeight + likesHeight + commentHeight
        requiredHeight += requiredImageHeight
        return requiredHeight
    }
    
    public var requiredImageHeight: CGFloat {
        return K.screenWidth / imageAspectRatio
    }
    
    init (postImgUrl: String, title: String, description: String, imageAspectRatio: Double) {
        self.postImgUrl = URL(string: postImgUrl)
        self.title = title
        self.description = description
        self.imageAspectRatio = imageAspectRatio
    }
    
}
