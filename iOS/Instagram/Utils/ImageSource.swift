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
    
    var runningRequests = [UUID: URLSessionDataTask]()
    
    private init() {}
    
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) -> UUID? {
        
        if let image = cache.object(forKey: urlString as NSString) {
            completion(image)
            return nil
        }
        
        let uuid = UUID()
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return nil
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
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
        }
        task.resume()
        
        runningRequests[uuid] = task
        return uuid
    }
    func cancelLoad(_ uuid: UUID) {
        runningRequests[uuid]?.cancel()
        runningRequests.removeValue(forKey: uuid)
    }
}
