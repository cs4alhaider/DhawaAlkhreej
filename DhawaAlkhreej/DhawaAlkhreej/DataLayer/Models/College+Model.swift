//
//  College+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 20/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct CollegeModel: Codable {
    
    let specializations: [SpecializationModel]?
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case specializations
        case id
        case name
    }
}
