//
//  SplashVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 17/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit
import Helper4Swift

class SplashVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tabBar = TabBarVC()
        present(tabBar, animated: true)
    }

}
