//
//  UITextField+Extensions.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 25/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

import UIKit.UITextField

extension UITextField {
    
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text ?? "")
    }
}
