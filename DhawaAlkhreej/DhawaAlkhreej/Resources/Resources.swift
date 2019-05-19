//
//  Resources.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

protocol ResourcesProtocol {
    var email: String? { get }
    var twitter: String? { get }
}

struct Resources {
    
    struct Abdullah: ResourcesProtocol {
        var email: String? = "cs.alhaider@gmail.com"
        var twitter: String? = "cs_alhaider"
    }
    
    struct Farouk: ResourcesProtocol {
        var email: String?
        var twitter: String? = "faroukzeino"
    }
    
    struct Riham: ResourcesProtocol {
        var email: String? = "Heemdesigner@gmail.com"
        var twitter: String? = "rihamdes"
    }
    
    struct Nourah: ResourcesProtocol {
        var email: String? = "erfaddesign@gmail.com"
        var twitter: String? = "erfadesign"
    }
    
    struct DhawaAlkhreej: ResourcesProtocol {
        var email: String? = "d_alkhreej@hotmail.com"
        var twitter: String? = "d_alkhreej"
    }
    
}
