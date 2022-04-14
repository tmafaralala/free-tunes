//
//  CustomViewController.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/07.
//

import UIKit

extension UIViewController {
    
    func displayErrorAlert(alertTitle: String,
                           alertMessage: String,
                           alertActionTitle: String) {
            let alert = UIAlertController(title: alertTitle,
                                          message: alertMessage,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: alertActionTitle,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
    }
    
}
