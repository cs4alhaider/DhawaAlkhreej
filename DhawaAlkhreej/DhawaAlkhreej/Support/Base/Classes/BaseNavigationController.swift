//
//  BaseNavigationController.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 14/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    var updateNavBarGradient: Void {
        get {
            return updateImageWithGradient()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    static func updateNavBarGradient1() {
        
    }
    
    func style() {
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.brownTextColor]
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: Identity.font(.custom(weight: .bold, size: 30)),
                                                  NSAttributedString.Key.foregroundColor: UIColor.brownTextColor]
        
        navigationBar.prefersLargeTitles = true
        navigationBar.isTranslucent = true
        
        self.updateImageWithGradient()
        
    }
    
    private func updateImageWithGradient() {
        
        let navBarHeight = navigationBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let heightAdjustment: CGFloat = 1
        
        let gradientHeight = navBarHeight + statusBarHeight + heightAdjustment
        var frame = navigationBar.bounds
        frame.size.height += UIApplication.shared.statusBarFrame.size.height
        frame.origin.y -= UIApplication.shared.statusBarFrame.size.height
        let bgimage = imageWithGradient(colors: UIColor.navBarGradientColors, size: CGSize(width: UIScreen.main.bounds.size.width, height: gradientHeight), horizontally: false)
        navigationBar.barTintColor = UIColor(patternImage: bgimage!)
    }
    
    private func imageWithGradient(colors: [CGColor], size: CGSize, horizontally: Bool = true) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = colors
        if horizontally {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        }
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
