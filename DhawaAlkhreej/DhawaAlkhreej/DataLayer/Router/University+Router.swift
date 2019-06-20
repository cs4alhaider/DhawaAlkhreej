//
//  University+Router.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 20/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

extension Router {
    
    enum University: DhawaAlkhreejEndpoint {
        
        case getUniversitys
        
        var serviceUrl: String {
            switch self {
            case .getUniversitys:
                return "Universitys-Data.json"
            }
        }
        
        var parameters: [String: Any]? {
            switch self {
            case .getUniversitys:
                return nil
            }
        }
        
        var headers: [String: String]? {
            switch self {
            case .getUniversitys:
                return nil
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getUniversitys:
                return .get
            }
        }
        
        var isPrintable: Bool {
            switch self {
            case .getUniversitys:
                return true
            }
        }
        
    }
}
