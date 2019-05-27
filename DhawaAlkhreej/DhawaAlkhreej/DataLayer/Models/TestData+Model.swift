//
//  TestData+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 26/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct TestData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

extension TestData {
    static func getData(completion: @escaping DataResponse<[TestData]>) {
        Router.TestData.getCollection.request(completion: completion)
    }
}
