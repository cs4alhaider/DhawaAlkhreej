//
//  DataModel+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 17/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    
    let country: CountryModel?
    
    enum CodingKeys: String, CodingKey {
        case country
    }
}
