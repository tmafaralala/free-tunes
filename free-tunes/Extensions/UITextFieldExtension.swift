//
//  CustomTextField.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/01.
//

import UIKit

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

    func applyDefaultStyle(withName: String?) {
        self.layer.borderColor = (UIColor.lightGray).cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 8
        if withName != nil {
            self.layer.name = withName
        }
    }

    func applyPrimaryColorOutline() {
        self.layer.borderColor = UIColor(named: "AppPrimaryColor")?.cgColor
    }
    
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}
