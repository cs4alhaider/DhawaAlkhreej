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
        getData()
    }
    
    private func loadApp() {
        let tabBar = TabBarVC()
        let onBoarding = UIStoryboard.OnBoarding.instantiateViewController(withClass: WalkthroughVC.self)
        self.present(tabBar, animated: true)
        if !UserDefaults.standard.bool(forKey: K.UserDefaults.onBoardingViewed) {
            tabBar.presentVC(onBoarding)
        }
    }
    
    func getData() {
        DataModel.getUniversitys { (result) in
            switch result {
            case .success:
                self.loadApp()
            case .failure(let error):
                AlertHelper.showBasicAlert(vc: self, title: L.G.error.localizedText, message: error.localizedDescription, buttonTitle: L.G.ok.localizedText)
            }
        }
    }
}
