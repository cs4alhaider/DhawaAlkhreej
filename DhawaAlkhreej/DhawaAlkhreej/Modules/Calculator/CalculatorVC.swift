//
//  CalculatorViewController.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 21/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class CalculatorVC: BaseViewController {

    // MARK: Labels
    @IBOutlet var ThanwiyahLabel: UILabel!
    @IBOutlet var quodratLabel: UILabel!
    @IBOutlet var tahsilyLabel: UILabel!
    @IBOutlet var stepExamLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    // MARK: Buttons
    @IBOutlet var calculateButton: UIButton!
    
    // MARK: Requsted TextFields
    @IBOutlet var requestedThanawiyahTF: DesignableTF!
    
    // MARK: Class Variables
    var percantages = ["٠٪", "١٠٪", "٢٠٪", "٣٠٪", "٤٠٪", "٥٠٪", "٦٠٪"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPercentagePicker()
        setupUI()
    }
    
    internal override func setupUI() {
        
        ThanwiyahLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        quodratLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        tahsilyLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        stepExamLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.shadowOffset = CGSize.zero
        calculateButton.layer.shadowOpacity = 0.2
        calculateButton.titleLabel?.font = Identity.font(.custom(weight: .bold, size: 20))
        
        resultLabel.textColor = UIColor.primary
        resultLabel.font = Identity.font(.custom(weight: .bold, size: 20))
    }
    
    private func createPickerToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.primary
        
        let doneButton = UIBarButtonItem(title: "إنهاء", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        requestedThanawiyahTF.inputAccessoryView = toolBar
        
    }
    
    private func createPercentagePicker() {
        
        createPickerToolbar()
        let percentagePicker = UIPickerView()
        percentagePicker.delegate = self
        
        requestedThanawiyahTF.inputView = percentagePicker
        percentagePicker.backgroundColor = UIColor.whiteBackground
   
    }
    
}
