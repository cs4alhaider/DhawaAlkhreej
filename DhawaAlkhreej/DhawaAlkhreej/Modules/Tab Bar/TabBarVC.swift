//
//  TabBarVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit
import Helper4Swift

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the ui
        setupUI()
        // Adding the root view controllers
        rootViewControllers()
    }
    
    /// Setting up the UI
    func setupUI() {
        tabBar.barTintColor = Identity.color(.whiteBackground)
        tabBar.tintColor = Identity.color(.primary)
        tabBar.isTranslucent = false
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = Identity.color(.brownTextColor)
        }
    }
    
    func rootViewControllers() {
        
        // Left VC
        let tabVC1 = createViewController(nv: UINavigationController(),
                                          vc: UIViewController(),
                                          selectedImage: #imageLiteral(resourceName: "tabBar1"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar1"),
                                          title: "tabVC1")
        
        // Middle VC
        let storyboard = UIStoryboard.init(name: "Calculator", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CalculatorVC")
        let tabVC2 = createViewController(nv: UINavigationController(),
                                          vc: vc,
                                          selectedImage: #imageLiteral(resourceName: "tabBar2"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar2"),
                                          title: "tabVC2")
        
        // Right VC
        let tabVC3 = createViewController(nv: UINavigationController(),
                                          vc: UIViewController(),
                                          selectedImage: #imageLiteral(resourceName: "tabBar3"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar3"),
                                          title: "tabVC3")
        
        let tabVC4 = createViewController(nv: UINavigationController(),
                                          vc: UIViewController(),
                                          selectedImage: #imageLiteral(resourceName: "tabBar4"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar4"),
                                          title: "tabVC4")
        
        viewControllers = [tabVC1, tabVC2, tabVC3, tabVC4]
    }
}
