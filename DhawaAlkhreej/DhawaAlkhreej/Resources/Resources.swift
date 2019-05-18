//
//  Resources.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

protocol ResourcesProtocol {
    var email: String { get }
    var twitter: String { get }
}

struct Resources {
    
    struct Abdullah: ResourcesProtocol {
        var email: String {
            return "cs.alhaider@gmail.com"
        }
        
        var twitter: String {
            return "cs_alhaider"
        }
    }
    
    // Same 
}
