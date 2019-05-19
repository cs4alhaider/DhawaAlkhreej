//
//  DataRequester.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct DataRequester {
    
    static func request(url: String,
                        headers: [String: String]? = nil,
                        httpMethod: HTTPMethod,
                        parameters: [String: Any]? = nil,
                        isPrintable: Bool,
                        location: DataLocation,
                        completion: @escaping (Result<Data, Error>) -> Void) {
        if location == .online {
            // Api request
        } else if location == .offline {
            // notaToDo
            // From a json file
        }
    }
}
