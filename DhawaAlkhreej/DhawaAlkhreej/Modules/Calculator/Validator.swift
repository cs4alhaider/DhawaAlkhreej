//
//  Validator.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 25/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

class ValidationError: Error {
    
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    
    case percentage    
}

enum VaildatorFactory {
    
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .percentage: return  PercentageValidator()
        }
    }
}

struct PercentageValidator: ValidatorConvertible {
    
    func validated(_ value: String) throws -> String {
        
        guard value != "" else { throw ValidationError("Percentage is Required") }
        let englishNumber = value.toEnglishNumbers.replacingOccurrences(of: "٫", with: ".")
        guard let number = Double(englishNumber) else { throw ValidationError("Couldn't convert String into Double") }
        
        if number > 100.0 {
            throw ValidationError("Percentage cann't be greater than 100.0")
        }
        
        return value
    }
}
