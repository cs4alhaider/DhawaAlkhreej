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
            return "https://twitter.com/cs_alhaider"
        }
    }
    struct Farouk: ResourcesProtocol {
        var email: String {
            return ""
        }
        var twitter: String {
            return "http://twitter.com/faroukzeino"
        }
    }
    struct Riham: ResourcesProtocol {
        var email: String {
            return "Heemdesigner@gmail.com"
        }
        
        var twitter: String {
            return "https://twitter.com/rihamdes"
        }
    }
    struct Nourah: ResourcesProtocol {
        var email: String {
            return "erfaddesign@gmail.com"
        }
        
        var twitter: String {
            return "https://twitter.com/erfadesign"
        }
    }
    struct DhawaAlkhreej: ResourcesProtocol {
        var email: String {
            return "d_alkhreej@hotmail.com"
        }
        
        var twitter: String {
            return "https://twitter.com/d_alkhreej"
        }
    }
    
}
