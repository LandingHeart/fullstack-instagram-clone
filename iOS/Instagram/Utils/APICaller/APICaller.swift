//
//  APICaller.swift
//  Instagram
//
//  Created by Huang Yan on 10/18/22.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class APICaller {
    static let shared = APICaller()
    func fetchData<T: Codable>(url: String, expecting: T.Type, decoder: JSONDecoder = JSONDecoder() ,completion: @escaping (Result<T,NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.serverError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            var decodedResult: T?
            do {
                decodedResult = try decoder.decode(T.self, from: data)
            } catch {
                completion(.failure(.decodingError))
            }
            guard let result = decodedResult else {
                completion(.failure(.decodingError))
                return
            }
            completion(.success(result))
        }
        task.resume()
    }
}
