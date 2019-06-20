//
//  Specialization+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 20/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct SpecializationModel: Codable {
    
    let certificate: [CertificateModel]?
    let conditions: String?
    let field: String?
    let id: Int?
    let jobs: String?
    let locationByGender: [LocationByGenderModel]?
    let name: String?
    let overview: String?
    let planUrl: String?
    let weightedAverage: [WeightedAverageModel]?
    let years: String?
    
    enum CodingKeys: String, CodingKey {
        case certificate
        case conditions
        case field
        case id
        case jobs
        case locationByGender
        case name
        case overview
        case planUrl
        case weightedAverage
        case years
    }
}
