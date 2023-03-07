//
//  IGService.swift
//  Instagram
//
//  Created by Huang Yan on 2/22/23.
//
import Foundation

final class IGService {

    static let shared = IGService()

    private init() {}

    //MARK: - Public
    
    public func execute <T:Codable> (_ urlRequest: URLRequest, expecting: T.Type, completion: @escaping(Result<T,Error>) -> Void) {

        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            /// Validate server response
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            /// Decoding:
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(T.self, from: data) else {
                print("error: could not decode")
                completion(.failure(URLError(.cannotDecodeContentData)))
                return
            }
            /// Returning data by calling callback function
            completion(.success(decodedData))
        }.resume()
    }

    public func loginUser(email: String, password: String, completion: @escaping(Result<IGUser,Error>) -> Void) {
        //Generate Request
        guard var request = IGRequest.loginRequest.urlRequest else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let jsonDictionary = ["email": email, "password": password]
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: jsonDictionary, options: .fragmentsAllowed)

        execute(request, expecting: IGUser.self) { result in
            switch result {
            case .success(let user):
                UserCredential.shared.didLogin(user: user, password: password)
                completion(.success(user))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    public func register(email: String,
                         username: String,
                         password: String,
                         completion: @escaping(Result<IGUser,Error>) -> Void) {
        //Generate Request
        guard var request = IGRequest.registerRequest.urlRequest else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let jsonDictionary = ["email": email, "username": username, "password": password]
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: jsonDictionary, options: .fragmentsAllowed)

        execute(request, expecting: IGUser.self) { result in
            switch result {
            case .success(let user):
                UserCredential.shared.didLogin(user: user, password: password)
                completion(.success(user))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    
    public func fetchAllPost(completion: @escaping(Result<[IGPost],Error>) -> Void ) {
        guard let request = IGRequest.allPostRequest.urlRequest else {
            completion(.failure(URLError(.badURL)))
            return
        }
        execute(request, expecting: [IGPost].self) { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    //MARK: - Private
}
