//
//  DataModel+Model.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 17/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    
    static private(set) var current: DataModel?
    
    let country: CountryModel?
    
    enum CodingKeys: String, CodingKey {
        case country
    }
}

extension DataModel {
    
    static var universitys: [UniversityModel]? {
        return DataModel.current?.country?.universitys
    }
    
    static func getUniversitys(completion: @escaping DataResponse<DataModel>) {
        _getUniversitys { (result) in
            switch result {
            case .success(let data):
                current = data // caching the data in the memory
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private static func _getUniversitys(completion: @escaping DataResponse<DataModel>) {
        Router.University.getUniversitys.request(completion: completion)
    }
}
