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
        headerText.buildCustomLabel(labelFirstPart: "free",
                                    firstColor: UIColor.primaryColor.cgColor,
                                    labelSecondPart: "Tunes",
                                    secondColor: UIColor.secondaryyColor.cgColor,
                                    size: 40)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
