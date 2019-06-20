//
//  LocalizationResources.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

typealias L = LocalizationResources

struct LocalizationResources {
    
    typealias G = General
    
    /// General text used in different places
    enum General {
        
        case ok
        case custom(String)
        
        var localizedText: String {
            switch self {
            case .ok:
                return "OK".localized
            case .custom(let customText):
                return customText.localized
            }
        }
    }
}
