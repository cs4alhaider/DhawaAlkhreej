//
//  TestData+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 26/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct TestData: Codable {
    let name: String
    let color: String
    let ver: Int
}

extension TestData {
    static func getData(completion: @escaping (Result<TestData, Error>) -> Void) {
        Router.TestData.getCollection.request(completion: completion)
    }
}
