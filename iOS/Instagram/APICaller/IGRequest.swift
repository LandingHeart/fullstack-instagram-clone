//
//  IGRequest.swift
//  Instagram
//
//  Created by Huang Yan on 2/22/23.
//
import Foundation

final class IGRequest {

    private let baseUrl = "http://localhost:8080/api/"

    private let endpoint: IGEndpoint

    private let httpMethod: String

    private let paths: [String]

    private var urlString: String {
        var urlString = baseUrl + endpoint.rawValue + "/"

        if !paths.isEmpty {
            for path in paths {
                urlString += "\(path)/"
            }
        }

        return urlString
    }

    public var url: URL? {
        return URL(string: urlString)
    }

    public var urlRequest: URLRequest? {
        guard let url = self.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.httpMethod

        return urlRequest
    }

    //MARK: - Inititalizer
    init(endpoint: IGEndpoint, paths: [String] = [], httpMethod: String = .get) {
        self.endpoint = endpoint
        self.paths = paths
        self.httpMethod = httpMethod
    }


    //convenience requests
    // User
    static let loginRequest = IGRequest(endpoint: .user, paths: ["login"], httpMethod: .post)
    static let renewTokenRequest = IGRequest(endpoint: .user, paths: ["token"], httpMethod: .post)
    static let logoutRequest = IGRequest(endpoint: .user, paths: ["logout"], httpMethod: .delete)
    
    // Post
    static let allPostRequest = IGRequest(endpoint: .post, httpMethod: .get)
}
