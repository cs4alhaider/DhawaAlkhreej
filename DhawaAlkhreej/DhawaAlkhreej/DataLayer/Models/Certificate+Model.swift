//
//  Certificate+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 20/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct CertificateModel: Codable {
    
    let nameAr: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case nameAr
        case type
    }
}
