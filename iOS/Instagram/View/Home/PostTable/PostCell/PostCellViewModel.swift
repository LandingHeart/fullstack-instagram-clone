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
    
    func configure(with cell: PostCell) {
        let token = ImageSource.shared.fetchImage(urlString: imageUrl) { image in
            DispatchQueue.main.async {
                cell.images.image = image
                cell.layoutSubviews()
            }
        }
        cell.onReuse = {
            if let token = token {
                ImageSource.shared.cancelLoad(token)
            }
        }
        
    }
}

