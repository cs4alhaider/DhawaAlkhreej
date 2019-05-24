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
    @IBOutlet var calculatedPercentageLabel: UILabel!
    
    // MARK: Buttons
    @IBOutlet var calculateButton: UIButton!
    
    // MARK: Requsted Textfields
    @IBOutlet var requestedThanawiyahTF: DesignableTF!
    @IBOutlet var requestedQuodratTF: DesignableTF!
    @IBOutlet var requestedTahsilyTF: DesignableTF!
    @IBOutlet var requestedStepExamTF: DesignableTF!
    
    // MARK: Accomplished Textfields
    @IBOutlet var accoplishedThanawiyahTF: DesignableTF!
    @IBOutlet var accomplishedQuodratTF: DesignableTF!
    @IBOutlet var accomplishedTahsilyTF: DesignableTF!
    @IBOutlet var accomplishedStemExamTF: DesignableTF!
    
    // MARK: Class Variables
    var percantages = ["٠٪", "١٠٪", "٢٠٪", "٣٠٪", "٤٠٪", "٥٠٪", "٦٠٪"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPercentagePicker()
    }
    
    override func setupUI() {
        
        setTitles(navigationTitle: "احسب نسبتك")
        setupExamsLabels()
        setupCalculateButton()
        setupCalculatedPercentageLabel()
        setupTextfeilds()
    }
    
    private func setupExamsLabels() {
        
        ThanwiyahLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        quodratLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        tahsilyLabel.font = Identity.font(.custom(weight: .bold, size: 20))
        stepExamLabel.font = Identity.font(.custom(weight: .bold, size: 20))
    }
    
    private func setupCalculateButton() {
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.shadowOffset = CGSize.zero
        calculateButton.layer.shadowOpacity = 0.2
        calculateButton.titleLabel?.font = Identity.font(.custom(weight: .bold, size: 20))
    }
    
    private func setupCalculatedPercentageLabel() {
        
        calculatedPercentageLabel.textColor = UIColor.primary
        calculatedPercentageLabel.font = Identity.font(.custom(weight: .bold, size: 20))
    }
    
    private func setupTextfeilds() {
        
        requestedThanawiyahTF.tintColor = UIColor.primary
        requestedQuodratTF.tintColor = UIColor.primary
        requestedTahsilyTF.tintColor = UIColor.primary
        requestedStepExamTF.tintColor = UIColor.primary
        accoplishedThanawiyahTF.tintColor = UIColor.primary
        accomplishedQuodratTF.tintColor = UIColor.primary
        accomplishedTahsilyTF.tintColor = UIColor.primary
        accomplishedStemExamTF.tintColor = UIColor.primary
    }
    
    private func createPercentagePicker() {
        
        createPickerToolbar()
        let percentagePicker = UIPickerView()
        percentagePicker.delegate = self
        
        requestedThanawiyahTF.inputView = percentagePicker
        requestedQuodratTF.inputView = percentagePicker
        requestedTahsilyTF.inputView = percentagePicker
        requestedStepExamTF.inputView = percentagePicker
        
        percentagePicker.backgroundColor = UIColor.whiteBackground
        
    }
    
    private func createPickerToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.brownTextColor
        
        let doneButton = UIBarButtonItem(title: "إنهاء", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        requestedThanawiyahTF.inputAccessoryView = toolBar
        requestedQuodratTF.inputAccessoryView = toolBar
        requestedTahsilyTF.inputAccessoryView = toolBar
        requestedStepExamTF.inputAccessoryView = toolBar
        
    }
 
}
