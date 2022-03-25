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
    func login(username: String, password: String)  {
        if username.isEmpty || password.isEmpty {
            delegate?.notifyEmptyData()
            return
        }
        
        if checkTextFieldData(usernameInput: username, passwordInput: password) {
            if verifyCredentials(username: username, password: password) {
                delegate?.navigate()
            }
        }
    }

    func verifyCredentials(username: String, password: String) -> Bool {
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
