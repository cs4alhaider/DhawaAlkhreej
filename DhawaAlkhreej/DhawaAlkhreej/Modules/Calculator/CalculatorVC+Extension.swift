//
//  CalculatorVC+Extenstion.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 23/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

extension CalculatorVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return percantages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return percantages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if requestedThanawiyahTF.isFirstResponder {
            requestedThanawiyahTF.text = percantages[row]
            saveTextfieldData(.requestedThanawiyahTF, data: percantages[row])
        } else if requestedQuodratTF.isFirstResponder {
            requestedQuodratTF.text = percantages[row]
            saveTextfieldData(.requestedQuodratTF, data: percantages[row])
        } else if requestedTahsilyTF.isFirstResponder {
            requestedTahsilyTF.text = percantages[row]
            saveTextfieldData(.requestedTahsilyTF, data: percantages[row])
        } else if requestedStepExamTF.isFirstResponder {
            requestedStepExamTF.text = percantages[row]
            saveTextfieldData(.requestedStepExamTF, data: percantages[row])
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = UIColor.brownTextColor
        label.textAlignment = .center
        label.text = percantages[row]
        label.font = Identity.font(.custom(weight: .regular, size: 20))
        
        return label
    }
}
