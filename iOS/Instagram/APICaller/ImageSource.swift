//
//  ImageSource.swift
//  Instagram
//
//  Created by Huang Yan on 10/24/22.
//

import UIKit

final class ImageSource {
    
    static let shared = ImageSource()
    
    var oldCache = NSCache<NSString, UIImage>()
    
    var cache = NSCache<NSString, NSData>()
    
    var runningRequests = [UUID: URLSessionDataTask]()
    
    private init() {}
    
    public func downloadImage(url: URL?, completion: @escaping(Result<Data, Error>) -> Void ) {
        guard let url = url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let key = url.absoluteString as NSString
        if let data = cache.object(forKey: key) {
            print("using cache")
            completion(.success(data as Data))
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            self?.cache.setObject(data as NSData, forKey: key)
            print("downloaded image")
            completion(.success(data))
        }.resume()
    }
    
    
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) -> UUID? {
        
        if let image = oldCache.object(forKey: urlString as NSString) {
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
                self?.oldCache.setObject(image, forKey: urlString as NSString)
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
