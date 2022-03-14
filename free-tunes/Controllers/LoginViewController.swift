//
//  LoginViewController.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit

class LoginViewController: UIViewController {

// MARK: - Interface Builder Outlets
    @IBOutlet private weak var headerText: UILabel!
    @IBOutlet private weak var  usernameInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!

// MARK: - Runtime Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputFields()
        headerText.buildCustomLabel(labelFirstPart: "free", labelSecondPart: "Tunes")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if checkTextFieldData() {
            return getAuthenticator().login(username: usernameInput.text, password: passwordInput.text)
        }
        return false
    }

// MARK: - InputFields Setup
    func setupInputFields() {
        setupUsernamInputField()
        setupPasswordInputField()
    }
    
    func setupUsernamInputField() {
        usernameInput.applyDefaultStyle(withName: "Username")
        usernameInput.delegate = self
    }
    
    func setupPasswordInputField() {
        passwordInput.applyDefaultStyle(withName: "Password")
        passwordInput.delegate = self
    }

// MARK: - Input Validation
    func checkTextFieldData() -> Bool {
        if usernameInput.text != "" && passwordInput.text != "" {
            return true
        }
        emptyTextFields()
        return false
    }

    func emptyTextFields() {
        usernameInput.emptyFieldError()
        passwordInput.emptyFieldError()
    }

}
