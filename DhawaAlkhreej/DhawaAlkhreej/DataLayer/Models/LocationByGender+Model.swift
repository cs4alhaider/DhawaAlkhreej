//
//  LocationByGender+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 20/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct LocationByGenderModel: Codable {
    
    let gen: String?
    let loc: String?
    
    enum CodingKeys: String, CodingKey {
        case gen
        case loc
    }
}
