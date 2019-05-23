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
        // Adding padding
        fixImageInsets()
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
        
        let tabVC1 = createViewController(nv: UINavigationController(),
                                          vc: UIViewController(),
                                          selectedImage: #imageLiteral(resourceName: "tabBar1"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar1"),
                                          title: "")
        
        let tabVC2 = createViewController(nv: UINavigationController(),
                                          vc: UIStoryboard.calculator.instantiateViewController(withClass: CalculatorVC.self),
                                          selectedImage: #imageLiteral(resourceName: "tabBar2"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar2"),
                                          title: "")
        
        let tabVC3 = createViewController(nv: UINavigationController(),
                                          vc: UIStoryboard.majors.instantiateViewController(withClass: SectionsVC.self),
                                          selectedImage: #imageLiteral(resourceName: "tabBar3"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar3"),
                                          title: "")
        
        let tabVC4 = createViewController(nv: UINavigationController(),
                                          vc: UIStoryboard.majors.instantiateViewController(withClass: SavedMajorsVC.self),
                                          selectedImage: #imageLiteral(resourceName: "tabBar4"),
                                          unselectedImage: #imageLiteral(resourceName: "tabBar4"),
                                          title: "")
        
        viewControllers = [tabVC1, tabVC2, tabVC3, tabVC4]
    }
    
    func fixImageInsets() {
        guard let item = tabBar.items else { return }
        item.forEach({ $0.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0) })
    }
}
