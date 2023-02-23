//
//  AuthService.swift
//  Instagram
//
//  Created by Huang Yan on 2/22/23.
//

import Foundation
enum UserState {
    case signedIn(accessToken: String, refreshToken: String)
    case notSignedIn
}

class AuthService {
    func signIn(username: String, password: String, completion: @escaping (Result<IGUser, Error>) -> Void) {
        
    }
    
    func renewAccessToken(refreshToken: String) {
    }
    
//    public func authenticate(username: String, password: String) async throws -> Bool {
//    }
//
//    private func generateAccessToken() -> String {
//
//    }
//
//    private func generateRefreshToken() -> String {
//
//    }
    
    private func validateRefreshToken(_ refreshToken: String) async throws -> Bool {
        // Simulate an asynchronous refresh token validation request to the backend
        if refreshToken == "refresh_token" {
            return true
        } else {
            throw NSError(domain: "RefreshToken", code: 1, userInfo: ["message": "Invalid refresh token"])
        }
    }
}

// Example usage:

let authService = AuthService()
