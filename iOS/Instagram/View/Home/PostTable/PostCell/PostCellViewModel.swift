//
//  PostCellViewModel.swift
//  Instagram
//
//  Created by Huang Yan on 10/22/22.
//

import UIKit

struct PostCellViewModel {
//    let iconUrl: String
//    let userName: String
    let imageUrl: String
//    let like: Int
//    let createdAt: String
    
    func configure(with vm: PostCellViewModel, view: PostCell) {
        ImageSource.shared.fetchImage(urlString: imageUrl) { image in
            DispatchQueue.main.async {
                view.images.image = image
            }
        }
    }
}

