//
//  Identity.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

struct Identity {
    
    static func font(_ type: FontType) -> UIFont {
        return type.font
    }
    
    static func color(_ type: ColorType) -> UIColor {
        return type.color
    }
    
}
