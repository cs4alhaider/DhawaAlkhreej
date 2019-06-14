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
    case requiredField(field: String)
}

enum VaildatorFactory {
    
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .percentage: return  PercentageValidator()
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
        }
    }
}

struct PercentageValidator: ValidatorConvertible {
    
    func validated(_ value: String) throws -> String {
        
        // guard value != "" else { throw ValidationError("Percentage is Required") }
        let englishNumber = value.toEnglishNumbers.replacingOccurrences(of: "٫", with: ".")
        guard let number = Double(englishNumber) else { throw ValidationError("هناك خطأ في صيغة النسبة المئوية") }
        
        if number > 100.0 {
            throw ValidationError("لا يمكن لأحد درجاتك أن تكون أكبر من ١٠٠٪")
        }
        
        return value
    }
}

struct RequiredFieldValidator: ValidatorConvertible {
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {
            throw ValidationError(fieldName + "مطلوب")
        }
        return value
    }
}
