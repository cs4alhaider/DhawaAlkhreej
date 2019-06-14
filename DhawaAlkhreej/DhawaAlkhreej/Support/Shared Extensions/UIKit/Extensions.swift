//
//  Extensions.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 28/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func changeTextField(_ textFeild: [UITextField], tintColor: UIColor? = nil, font: UIFont? = nil, placeholderColor: UIColor? = nil, text: String? = nil,
                         pickerView: UIPickerView? = nil) {
        
        if let color = tintColor {
            textFeild.forEach({ $0.tintColor = color })
        }
        if let font = font {
            textFeild.forEach({ $0.font = font })
        }
        if let placeholderColor = placeholderColor {
            textFeild.forEach({ $0.setPlaceHolderTextColor(placeholderColor) })
        }
        if let text = text {
            textFeild.forEach({ $0.text = text })
        }
        
        if let pickerView = pickerView {
            textFeild.forEach({ $0.inputView = pickerView })
        }
    }
}
