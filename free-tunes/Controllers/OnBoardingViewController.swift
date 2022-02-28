//
//  OnBoardingViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var headerText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        buildCustomLabel()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
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
}
