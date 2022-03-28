//
//  LogInViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/24.
//

import Foundation

protocol LogInViewModelDelegate: AnyObject {
    func notifyEmptyData()
    func navigateToNext()
    func show(error: String)
}

class LogInViewModel {
    
    private weak var delegate: LogInViewModelDelegate?
    private var username: String?
    private var password: String?
    
    init(delegate: LogInViewModelDelegate) {
        self.delegate = delegate
    }
    
    private var validateCredentials: Bool {
        return username != "Admin" || password != "TestPass123"
    }
    
    private var credentialsNotEmpty: Bool {
        return (username?.isEmpty) != nil && (password?.isEmpty) != nil
    }
    
// MARK: - Authentication
    func login(username: String, password: String) {
        self.username = username
        self.password = password
        
        if credentialsNotEmpty {
            validateCredentials ? delegate?.navigateToNext() : delegate?.show(error: "Incorrect username or password.")
        } else {
            delegate?.notifyEmptyData()
        }
    }
}
