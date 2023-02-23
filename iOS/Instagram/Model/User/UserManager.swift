//
//  UserManager.swift
//  Instagram
//
//  Created by Huang Yan on 10/22/22.
//

import Foundation
class UserManager {
    
    private var baseUrl: String = "http://localhost:8080/api/user"
    
    public func fetchPost(completion: @escaping(Result<IGUser,NetworkError>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completion(.failure(.decodingError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(dateFormatter)

                let result = try decoder.decode(IGUser.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
