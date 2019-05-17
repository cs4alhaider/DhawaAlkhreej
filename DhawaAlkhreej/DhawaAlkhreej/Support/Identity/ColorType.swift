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
    
    var color: UIColor {
        switch self {
        case .primary:
            return .primary
        }
    }
}
