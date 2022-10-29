//
//  UIImageView+Utils.swift
//  Instagram
//
//  Created by Huang Yan on 10/22/22.
//

import UIKit
//extension UIImageView {
//    func downloadImage(url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil,
//                  let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
//                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                  let image = UIImage(data: data)
//                else {
//                return
//            }
//            DispatchQueue.main.async { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    func downloadImage(urlString: String, contentMode mode: ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        downloadImage(url: url, contentMode: mode)
//    }
//}
