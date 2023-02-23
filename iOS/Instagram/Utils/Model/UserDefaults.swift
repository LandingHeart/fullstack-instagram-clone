//
//  UserDefaults.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import Foundation

extension UserDefaults {
    
    //save data
    func setCodableObject<T: Codable>(_ data: T?, forKey defaultName: String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded, forKey: defaultName)
    }
    
    //retrive data
    func codableObject<T : Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
          return nil
        }
        return try? JSONDecoder().decode(T.self, from: userDefaultData)
      }
}
