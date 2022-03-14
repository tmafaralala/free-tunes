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
        headerText.buildCustomLabel(labelFirstPart: "free", labelSecondPart: "Tunes")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
}
