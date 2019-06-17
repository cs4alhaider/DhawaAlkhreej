//
//  AppColors.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Primary color
    static var primary: UIColor {
        return UIColor(named: "primary") ?? #colorLiteral(red: 0.9921568627, green: 0.7529411765, blue: 0.3019607843, alpha: 1)
    }
    
    /// White background
    static var whiteBackground: UIColor {
        return UIColor(named: "whiteBackground") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    /// White text color
    static var whiteTextColor: UIColor {
        return UIColor(named: "whiteTextColor") ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    /// Brown text color
    static var brownTextColor: UIColor {
        return UIColor(named: "brownTextColor") ?? #colorLiteral(red: 0.3490196078, green: 0.3333333333, blue: 0.3215686275, alpha: 1)
    }
    
    /// Brown background color
    static var brownBackground: UIColor {
        return UIColor(named: "brownBackground") ?? #colorLiteral(red: 0.3490196078, green: 0.3333333333, blue: 0.3215686275, alpha: 1)
    }
    
    /// Naviagtion Bar Gradient Colors
    static var navBarGradientColors: [CGColor] {
        let color1 = UIColor(red: 250.0 / 255.0, green: 240.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 254.0 / 255.0, green: 247.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0).cgColor
        let color3 = UIColor(red: 250.0 / 255.0, green: 253.0 / 255.0, blue: 1.0, alpha: 1.0).cgColor
        // let color4 = UIColor(white: 252.0 / 255.0, alpha: 1.0).cgColor
        return [color3, color2, color1]
    }
}
