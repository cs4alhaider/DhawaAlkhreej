//
//  TestData+Router.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 26/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

extension Router {
    
    enum TestData: DhawaAlkhreejEndpoint {
        
        case getCollection
        
        var serviceUrl: String {
            switch self {
            case .getCollection:
                return "Test-data.json"
            }
        }
        
        var parameters: [String: Any]? {
            switch self {
            case .getCollection:
                return nil
            }
        }
        
        var headers: [String: String]? {
            switch self {
            case .getCollection:
                return nil
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getCollection:
                return .get
            }
        }
        
        var isPrintable: Bool {
            switch self {
            case .getCollection:
                return true
            }
        }
        
    }
}
