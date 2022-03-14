//
//  LogInViewControllerExtension.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/14.
//

import UIKit

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
