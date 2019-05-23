//
//  ColorType.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

enum ColorType {
    
    case primary
    case whiteBackground
    case whiteTextColor
    case brownBackground
    case brownTextColor
    
    var color: UIColor {
        switch self {
        case .primary:
            return .primary
        case .whiteBackground:
            return .whiteBackground
        case .whiteTextColor:
            return .whiteTextColor
        case .brownBackground:
            return .brownBackground
        case .brownTextColor:
            return .brownTextColor
        }
    }
}
