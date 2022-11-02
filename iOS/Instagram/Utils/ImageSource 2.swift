//
//  ImageSource.swift
//  Instagram
//
//  Created by Huang Yan on 10/24/22.
//

import UIKit

class ImageSource {
    
    static let shared = ImageSource()
    
    var cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        if let image = cache.object(forKey: urlString as NSString) {
            print("using cache")
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            print("fetching through network")
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                guard let image = image else {
                    completion(nil)
                    return
                }
                self?.cache.setObject(image, forKey: urlString as NSString)
                completion(image)
            }
        }.resume()
        
    }
}
