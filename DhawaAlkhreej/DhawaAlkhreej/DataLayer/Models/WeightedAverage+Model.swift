//
//  WeightedAverage+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 20/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

enum WeightedAverageModel: String, Codable {
    
    case female
    case male
    
    enum CodingKeys: String, CodingKey {
        case female = "Female"
        case male = "male"
    }
}
