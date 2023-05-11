//
//  IGPost.swift
//  Instagram
//
//  Created by Huang Yan on 10/18/22.
//

import Foundation

struct IGPost: Codable{
    
    let id: Int
    
    let title: String
    
    let likes: Int
    
    let dislikes: Int
    
    let postImgUrl: String
    
    let width: Int
    
    let height: Int
    
    let aspectRatio: Double
    
    let description: String
    
    let deletedAt: String?
    
    let createdAt: String
    
    let updatedAt: String
    
    let userId: Int
}

