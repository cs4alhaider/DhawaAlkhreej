//
//  Environment.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

enum Environment {
    
    case development
    case production
    
    static var current: Environment {
        #if DEBUG
        return .development
        #else
        return .prod
        #endif
    }
        
    static var isDevelopment: Bool {
        return current == .development
    }
    
    static var baseURL: String {
        return Environment.current == production ? production.url : development.url
    }
    
    private var url: String {
        return self == .production ? "" : ""
    }
}
