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
    @IBOutlet private weak var usernameInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!
    
    private lazy var viewModel = LogInViewModel(delegate: self)

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
    
    @IBAction func logIn(_ sender: Any) {
        viewModel.login(username: usernameInput?.text ?? "", password: passwordInput?.text ?? "")
    }
}

extension LoginViewController: LogInViewModelDelegate {
    
    func notifyEmptyData() {
        usernameInput.emptyFieldError()
        passwordInput.emptyFieldError()
    }
    
    func navigate() {
        performSegue(withIdentifier: "NavigateHome", sender: self)
    }
    
    func show(error: String) {
        displayErrorAlert(alertTitle: "Invalid credentials.",
                          alertMessage: error,
                          alertActionTitle: "Try again")
    }
}
