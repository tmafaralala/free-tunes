//
//  LogInViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/24.
//

import Foundation

protocol LogInViewModelDelegate: ViewModelDelegate {
    func notify()
}

class LogInViewModel {
    
    private weak var delegate: LogInViewModelDelegate?
    
    init(delegate: LogInViewModelDelegate) {
        self.delegate = delegate
    }
    
// MARK: - Authentication
    func login(username: String?, password: String?) -> Bool {
        guard let logInUsername = username, let logInPassword = password else {
            delegate?.notify()
            return false
        }
        if checkTextFieldData(usernameInput: logInUsername, passwordInput: logInPassword) {
            return verifyCredentials(username: logInUsername, password: logInPassword)
        }
        return false
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
            delegate?.notify()
            return false
        }
        return true
    }
}
