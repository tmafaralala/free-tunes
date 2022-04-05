//
//  OnBoardingViewController.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit

class OnBoardingViewController: UIViewController {

// MARK: - Interface Builder Outlets
    @IBOutlet private weak var headerText: UILabel!
   
// MARK: - Runtime Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let firstColor = UIColor(named: "AppPrimaryColor")?.cgColor,
        let secondColor = UIColor(named: "AppSecondaryColor")?.cgColor else {
            return
        }

        headerText.buildCustomLabel(labelFirstPart: "free", firstColor: firstColor, labelSecondPart: "Tunes", secondColor: secondColor, size: 40)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
