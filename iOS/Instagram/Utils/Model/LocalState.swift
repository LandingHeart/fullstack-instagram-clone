//
//  LocalState.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import Foundation

final class LocalState {
    
    private enum Keys: String {
        // whether signed in or not
        case appState
        // get user info if signed in
        case userInfo
        
        case password
    }
    
    public static var appState: String? {
        get {
            return UserDefaults.standard.string(forKey: Keys.appState.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.appState.rawValue)
        }
    }
    
    public static var userInfo: IGUser? {
        get {
            return UserDefaults.standard.codableObject(dataType: IGUser.self, key: Keys.userInfo.rawValue)
        }
        set {
            UserDefaults.standard.setCodableObject(newValue, forKey: Keys.userInfo.rawValue)
        }
    }
    
    public static var password: String? {
        get {
            return UserDefaults.standard.string(forKey: Keys.password.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.password.rawValue)
        }
    }
}
