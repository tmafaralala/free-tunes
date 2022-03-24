//
//  LogInViewModel.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/24.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: String)
}

class LogInViewModel {
    
    private weak var delegate: ViewModelDelegate?
    
    init(delegate: ViewModelDelegate){
        self.delegate = delegate
    }
    
// MARK: - Input Validation
    func checkTextFieldData(usernameInput: String, passwordInput: String) -> Bool {
        if usernameInput.isEmpty && passwordInput.isEmpty {
            return false
        }
        return true
    }
}
