//
//  LoginViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!

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

    func loginRequest() -> Bool {
        if usernameInput.text != "Admin" || passwordInput.text != "TestPass123" {
            displayErrorAlert(alertTitle: "Invalid credentials.",
                                    alertMessage: "Incorrect Username or Password.",
                                    alertActionTitle: "Try again" ,
                                    alertDelegate: self)
            return false
        }
        return true
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if usernameInput.text != "" && passwordInput.text != "" {
            return loginRequest()
        }
        usernameInput.emptyFieldError()
        passwordInput.emptyFieldError()
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


