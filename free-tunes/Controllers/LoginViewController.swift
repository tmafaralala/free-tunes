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
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if checkTextFieldData() {
            let loginsession = self.getAuthenticator().login(username: usernameInput.text, password: passwordInput.text)
            if !loginsession {
                displayErrorAlert(alertTitle: "Invalid credentials.",
                                  alertMessage: "Incorrect username or password.",
                                  alertActionTitle: "Try again",
                                  alertDelegate: self)
            }
            return loginsession
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
        if usernameInput.isEmpty && passwordInput.isEmpty {
            emptyTextFields()
            return false
        }
        
        return true
    }

    func emptyTextFields() {
        usernameInput.emptyFieldError()
        passwordInput.emptyFieldError()
    }
}
