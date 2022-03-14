//
//  CustomLabel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/01.
//

import UIKit

extension UILabel {
    func buildCustomLabel(labelFirstPart: String, labelSecondPart: String) {

        guard let primaryColor = UIColor(named: "AppPrimaryColor")?.cgColor,
        let secondaryColor = UIColor(named: "AppSecondaryColor")?.cgColor else {
            return
        }

        let firstStringAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40),
                                     NSAttributedString.Key.foregroundColor: primaryColor] as
                                    [NSAttributedString.Key: Any]

        let secondStringAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40),
                                      NSAttributedString.Key.foregroundColor: secondaryColor] as
                                    [NSAttributedString.Key: Any]

        let firstString = NSMutableAttributedString(string: labelFirstPart,
                                                    attributes: firstStringAttributes)

        let secondString = NSMutableAttributedString(string: labelSecondPart,
                                                     attributes: secondStringAttributes)

        firstString.append(secondString)
        self.attributedText = firstString
    }
}
