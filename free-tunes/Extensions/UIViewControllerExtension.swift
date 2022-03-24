//
//  CustomViewController.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/07.
//

import UIKit

extension UIViewController {
    
    func getAuthenticator() -> AuthManager {
        return AuthManager()
    }
    
    func displayErrorAlert(alertTitle: String,
                           alertMessage: String,
                           alertActionTitle: String,
                           alertDelegate: UIViewController) {
        if alertTitle != "Empty login fields" {
            let alert = UIAlertController(title: alertTitle,
                                          message: alertMessage,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: alertActionTitle, style: UIAlertAction.Style.default, handler: nil))
            alertDelegate.present(alert, animated: true, completion: nil)
            return
        }
        else{
            alertDelegate
        }
    }
    
}
