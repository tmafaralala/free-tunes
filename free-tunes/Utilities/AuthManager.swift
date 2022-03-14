//
//  AuthManager.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/14.
//

import Foundation

class AuthManager {
    
    
    
    func login(username: String?, password: String?) -> Bool {
        guard let logInUsername = username, let logInPassword = password else {
            return false
        }
        return checkCredentials(username: logInUsername, password: logInPassword)
    }

    func checkCredentials(username: String?, password: String?) -> Bool {
        if username != "Admin" || password != "TestPass123" {
            return false
        }
        return true
    }
}
