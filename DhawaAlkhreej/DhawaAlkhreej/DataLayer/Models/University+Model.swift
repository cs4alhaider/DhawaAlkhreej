//
//  University+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 17/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct UniversityModel: Codable {
    
    // let colleges: [<#College#>]?
    let id: Int?
    let isPrivate: Bool?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        // case colleges = "colleges"
        case id
        case isPrivate
        case name
    }
}
