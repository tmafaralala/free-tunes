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
        setupUsernameField()
        setupPasswordField()
        buildCustomLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
    func setupUsernameField() {
        usernameInput.applyDefaultStyle(withName: "Username")
        usernameInput.delegate = self
        usernameInput.delegate = self
    }
    func setupPasswordField() {
        passwordInput.applyDefaultStyle(withName: "Password")
        passwordInput.delegate = self
        passwordInput.delegate = self
    }
    func buildCustomLabel() {
        let attrs1 = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40),
                      NSAttributedString.Key.foregroundColor:
                        UIColor(red: 81/255, green: 166/255, blue: 248/255, alpha: 1)]
        let attrs2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40),
                      NSAttributedString.Key.foregroundColor: UIColor.black]
        let attributedString1 = NSMutableAttributedString(string: "free", attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "Tunes", attributes: attrs2)
        attributedString1.append(attributedString2)
        headerText.attributedText = attributedString1
    }
    func loginRequest() -> Bool {
        if usernameInput.text != "Admin" || passwordInput.text != "TestPass123" {
            let alert = UIAlertController(title: "Invalid credentials.",
                                          message: "Incorrect Username or Password.",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
            textField.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textField.layer.name else {
            return
        }
        if name == "Username" || name == "Password"{
            textField.layer.borderColor = (UIColor.lightGray).cgColor
        }
    }
}

extension UITextField {
    func emptyFieldError() {
        guard let name = self.layer.name else {
            return
        }
        if self.text != "" {
            return
        }
        self.attributedPlaceholder = NSAttributedString(
            string: name+" required.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
        )
    }

    func applyDefaultStyle(withName: String) {
        self.layer.borderColor = (UIColor.lightGray).cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 8
        self.layer.name = withName
    }
}


