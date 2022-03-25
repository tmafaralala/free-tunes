//
//  LogInViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/24.
//

import Foundation

protocol LogInViewModelDelegate: AnyObject {
    func notifyEmptyData()
    func navigate()
    func show(error: String)
}

class LogInViewModel {
    
    private weak var delegate: LogInViewModelDelegate?
    
    init(delegate: LogInViewModelDelegate) {
        self.delegate = delegate
    }
    
// MARK: - Authentication
    func login(username: String?, password: String?)  {
        guard let logInUsername = username, let logInPassword = password else {
            delegate?.notifyEmptyData()
            return
        }
        
        if checkTextFieldData(usernameInput: logInUsername, passwordInput: logInPassword) {
            if verifyCredentials(username: logInUsername, password: logInPassword) {
                delegate?.navigate()
            }
        }
    }

    func verifyCredentials(username: String?, password: String?) -> Bool {
        if username != "Admin" || password != "TestPass123" {
            delegate?.show(error: "Incorrect username or password.")
            return false
        }
        return true
    }
    
// MARK: - Input Validation
    func checkTextFieldData(usernameInput: String, passwordInput: String) -> Bool {
        if usernameInput.isEmpty && passwordInput.isEmpty {
            delegate?.notifyEmptyData()
            return false
        }
        return true
    }
}
