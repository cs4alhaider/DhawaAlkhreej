//
//  DataRequester.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct DataRequester {
    
    static func request<T: Decodable>(url: String,
                                      headers: [String: String]? = nil,
                                      httpMethod: HTTPMethod,
                                      parameters: [String: Any]? = nil,
                                      isPrintable: Bool,
                                      location: DataLocation,
                                      completion: @escaping DataResponse<T>) {
        if location == .online {
            // Implement api request in the future
        } else if location == .offline {
            // From a json file
            let data = Bundle.main.decode(T.self, from: url)
            completion(.success(data))
            // TODO: Handel the error
        }
    }
}
