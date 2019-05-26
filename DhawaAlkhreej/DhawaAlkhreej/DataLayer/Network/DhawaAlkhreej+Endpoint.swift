//
//  DhawaAlkhreej+Endpoint.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 19/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

protocol DhawaAlkhreejEndpoint: Endpoint {
    var url: String { get }
}

extension DhawaAlkhreejEndpoint {
    
    var url: String {
        if !serviceUrl.contains("http") && serviceUrl.suffix(4) == "json" { // File
            return serviceUrl
        } else if serviceUrl.contains("http") { // Full url
            return serviceUrl
        } else { // service Url (basic endpoint)
            return Environment.baseURL + serviceUrl
        }
    }
    
    var location: DataLocation {
        return .offline
    }
}

extension DhawaAlkhreejEndpoint {
    
    /// The New Function for every request
    ///
    /// - Parameter completion: Result<T>
    ///
    /// - Author: Abdulla Alhaider
    func request<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        DataRequester.request(url: url,
                              headers: headers,
                              httpMethod: method,
                              parameters: parameters,
                              isPrintable: isPrintable,
                              location: location,
                              completion: completion)
        
    }
}
