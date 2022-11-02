//
//  User.swift
//  Instagram
//
//  Created by Huang Yan on 10/22/22.
//

import Foundation

struct User: Codable{
    
    let userId: Int
    let email: String
    let username: String
    let password: String
    let last_edit_date: Date
    let createdAt: Date
    let updatedAt: Date
    
}

