//
//  ImageManager.swift
//  Instagram
//
//  Created by Huang Yan on 10/22/22.
//

import UIKit
class ImageManager {
    
    public func fetchPost(url: String, completion: @escaping(Result<UIImage,NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.decodingError))
            return
        }
        var image = UIImage(named: "icon")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            image = UIImage(data: data)
            guard let image = image else {
                completion(.failure(.decodingError))
                return
            }
            completion(.success(image))
        }
        task.resume()
    }
}
