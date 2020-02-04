//
//  BaseNavigationController.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 14/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    /// **NOTE:** It's very important to call this property on any ViewController that has any kind of scrolling,
    /// EX: TableView, CollectionView, ScrollView etc... to apply the correct gradient for the small NavigationBar.
    /// You can call it like that in any scrollViewDidScroll method:
    /// ```
    /// guard let tabBar = UIApplication.topViewController() else { return }
    /// ((tabBar.navigationController) as? BaseNavigationController)?.updateNavBarGradient
    /// ```
    var updateNavBarGradient: Void {
        return updateImageWithGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    func style() {
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.brownTextColor]
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: Identity.font(.custom(weight: .bold, size: 30)),
                                                  NSAttributedString.Key.foregroundColor: UIColor.brownTextColor]
        navigationBar.prefersLargeTitles = true
        navigationBar.isTranslucent = true
        updateImageWithGradient()
    }
    
    private func updateImageWithGradient() {
        
        let navBarHeight = navigationBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let heightAdjustment: CGFloat = 2
        let gradientHeight = navBarHeight + statusBarHeight + heightAdjustment
        let bgImage = imageWithGradient(colors: UIColor.gradientColors, size: CGSize(width: UIScreen.main.bounds.size.width, height: gradientHeight))
        guard let image = bgImage else { return }
        navigationBar.barTintColor = UIColor(patternImage: image)
    }
    
    private func imageWithGradient(colors: [CGColor], size: CGSize) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.shouldRasterize = true
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
