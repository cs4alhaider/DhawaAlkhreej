//
//  FontType.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

enum FontType {
    
    /// bold withSize(20)
    case h1
    /// bold withSize(18)
    case h2
    /// bold withSize(17)
    case h3
    /// regular withSize(17)
    case h4
    /// regular withSize(16)
    case h5
    /// regular withSize(15)
    case h6
    /// Add (weight, size)
    case custom(weight: Font, size: CGFloat)
    
    var font: UIFont {
        switch self {
        case .h1:
            return Font.bold.name.withSize(20)
        case .h2:
            return Font.bold.name.withSize(18)
        case .h3:
            return Font.bold.name.withSize(17)
        case .h4:
            return Font.regular.name.withSize(17)
        case .h5:
            return Font.regular.name.withSize(16)
        case .h6:
            return Font.regular.name.withSize(15)
        case .custom(let weight, let size):
            return weight.name.withSize(size)
        }
    }
}
