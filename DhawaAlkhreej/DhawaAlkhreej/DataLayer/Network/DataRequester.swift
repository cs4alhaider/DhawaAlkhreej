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
            Bundle.main.decode(T.self, from: url) { (result) in
                switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
