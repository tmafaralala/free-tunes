//
//  LoginViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var headerText: UILabel!
    @IBOutlet private weak var  usernameInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputFields()
        headerText.buildCustomLabel(labelFirstPart: "free", labelSecondPart: "Tunes")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }

    func setupInputFields() {
        usernameInput.applyDefaultStyle(withName: "Username")
        usernameInput.delegate = self
        usernameInput.delegate = self
        passwordInput.applyDefaultStyle(withName: "Password")
        passwordInput.delegate = self
        passwordInput.delegate = self
    }

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

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if checkTextFieldData() {
            return login(username: usernameInput.text, password: passwordInput.text)
        }
        return false
    }

}

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let name = textField.layer.name else {
            return
        }
        if name == "Username" || name == "Password" {
            textField.applyPrimaryColorOutline()
        }

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textField.layer.name else {
            return
        }
        if name == "Username" || name == "Password"{
            textField.applyDefaultStyle(withName: nil)
        }
    }
}
