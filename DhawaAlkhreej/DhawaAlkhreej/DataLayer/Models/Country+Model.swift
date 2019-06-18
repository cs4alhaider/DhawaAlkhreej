//
//  Country+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 17/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct CountryModel: Codable {
    
    let name: String?
    let universitys: [UniversityModel]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case universitys 
    }
}
