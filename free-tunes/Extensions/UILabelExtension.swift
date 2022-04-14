//
//  CustomLabel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/01.
//

import UIKit

extension UILabel {
    func buildCustomLabel(labelFirstPart: String,
                          firstColor: CGColor ,
                          labelSecondPart: String ,
                          secondColor: CGColor,
                          size: CGFloat) {

        let firstStringAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size),
                                     NSAttributedString.Key.foregroundColor: firstColor] as
                                    [NSAttributedString.Key: Any]

        let secondStringAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: size),
                                      NSAttributedString.Key.foregroundColor: secondColor] as
                                    [NSAttributedString.Key: Any]

        let firstString = NSMutableAttributedString(string: labelFirstPart,
                                                    attributes: firstStringAttributes)

        let secondString = NSMutableAttributedString(string: labelSecondPart,
                                                     attributes: secondStringAttributes)

        firstString.append(secondString)
        self.attributedText = firstString
    }
    
    func characterSpacing(spacing: Double) {
        guard let text = self.text else {
            return
        }
        self.attributedText = NSAttributedString(string: text,
                                                 attributes:[NSAttributedString.Key.kern: spacing])
      }
}
