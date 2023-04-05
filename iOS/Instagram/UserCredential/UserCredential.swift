//
//  CredentialUser.swift
//  Instagram
//
//  Created by Huang Yan on 2/22/23.
//
import Foundation

final class UserCredential {

    ///Singleton
    static let shared = UserCredential()

    //Private
    private var id: Int?
    
    private var email: String?

    private var password: String?

    private var accessToken: String?

    private var refreshToken: String?

    //Public
    private var state: State

    enum State: String {
        case login
        case logout
    }
    private init() {
        self.state = UserCredential.initialState()
        if self.state == .login, let userInfo = LocalState.userInfo, let password = LocalState.password {
            self.email = userInfo.email
            self.password = password
            self.accessToken = userInfo.accessToken
            self.refreshToken = userInfo.refreshToken
        }
    }

    //MARK: - Public
    
    ///Redundent???
    public func setEmailPassword(email: String, password: String) {
        self.email = email
        self.password = password
    }
    public func getEmailPassword() -> (email: String, password: String)? {
        guard !email.isNilorEmpty && !password.isNilorEmpty else {
            return nil
        }
        return (email!, password!)
    }

    public func setAccessToken(token: String) {
        self.accessToken = token
    }
    public func getAccessToken() -> String? {
        return accessToken
    }

    public func getState() -> State {
        return self.state
    }

    public func setState(_ state: State) {
        LocalState.appState = state.rawValue
        self.state = state
    }

    public func didLogin(user: IGUser, password: String) {
        self.email = user.email
        self.password = password
        self.accessToken = user.accessToken
        self.refreshToken = user.refreshToken

        //store appState & userInfo in local storage (Security Risk???)
        LocalState.userInfo = user
        LocalState.password = password
        setState(.login)
    }

    //MARK: - Private
    /// get User State Stored in local storage
    /// - Returns: The User State in the scope of the application
    private static func initialState() -> State {
        guard let state = LocalState.appState else {
            return .logout
        }
        guard let state = State(rawValue: state) else {
            return .logout
        }
        switch state {
        case .login:
            return .login
        case .logout:
            return .logout
        }
    }
}
