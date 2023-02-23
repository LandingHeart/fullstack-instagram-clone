//
//  IGUser.swift
//  Instagram
//
//  Created by Huang Yan on 10/22/22.
//

import Foundation

struct IGUser: Codable {
    
    let id: Int
    
    let email: String
    
    let phone: Int?
    
    let username: String
    
    let password: String
    
    let last_edit_date: String?
    
    let createdAt: String
    
    let updatedAt: String
    
    let accessToken: String
    
    let refreshToken: String
    
}

