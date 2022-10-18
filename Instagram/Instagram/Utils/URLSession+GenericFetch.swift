//
//  URLSession+GenericFetch.swift
//  Instagram
//
//  Created by Huang Yan on 10/18/22.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

extension URLSession {
    func fetchData<T: Codable>(url: URL?, decoder: JSONDecoder ,completion: @escaping (Result<T,NetworkError>) -> Void) {
        guard let url = url else {
            completion(.failure(.serverError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
