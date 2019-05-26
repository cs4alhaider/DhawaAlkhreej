//
//  CalculatorViewController.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 21/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class CalculatorVC: BaseViewController {
    
    @IBOutlet var calculatedPercangedStackViewYPosition: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    
    // MARK: Labels
    @IBOutlet var ThanwiyahLabel: UILabel!
    @IBOutlet var quodratLabel: UILabel!
    @IBOutlet var tahsilyLabel: UILabel!
    @IBOutlet var stepExamLabel: UILabel!
    @IBOutlet var calculatedPercentageLabel: UILabel!
    
    // MARK: Buttons
    @IBOutlet var calculateButton: CalculateButton!
    
    // MARK: Requsted Textfields
    @IBOutlet var requestedThanawiyahTF: DesignableTF!
    @IBOutlet var requestedQuodratTF: DesignableTF!
    @IBOutlet var requestedTahsilyTF: DesignableTF!
    @IBOutlet var requestedStepExamTF: DesignableTF!
    
    // MARK: Accomplished Textfields
    @IBOutlet var accoplishedThanawiyahTF: DesignableTF!
    @IBOutlet var accomplishedQuodratTF: DesignableTF!
    @IBOutlet var accomplishedTahsilyTF: DesignableTF!
    @IBOutlet var accomplishedStepExamTF: DesignableTF!
    
    // MARK: Class Variables
    var percantages = ["٪٠", "٪١٠", "٪٢٠", "٪٢٥", "٪٣٠", "٪٤٠", "٪٥٠", "٪٦٠"]
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.calculateButton.changeStatus(to: .disabled)
        }
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
        
        calculatedPercangedStackViewYPosition.constant = 500
        calculatedPercentageLabel.textColor = UIColor.primary
        calculatedPercentageLabel.font = Identity.font(.custom(weight: .bold, size: 25))
    }
    
    private func setupTextfeilds() {
        
        requestedThanawiyahTF.tintColor = UIColor.primary
        requestedQuodratTF.tintColor = UIColor.primary
        requestedTahsilyTF.tintColor = UIColor.primary
        requestedStepExamTF.tintColor = UIColor.primary
        accoplishedThanawiyahTF.tintColor = UIColor.primary
        accomplishedQuodratTF.tintColor = UIColor.primary
        accomplishedTahsilyTF.tintColor = UIColor.primary
        accomplishedStepExamTF.tintColor = UIColor.primary
    }
    
    private func createPercentagePicker() {
        
        let percentagePicker = UIPickerView()
        percentagePicker.delegate = self
        
        requestedThanawiyahTF.inputView = percentagePicker
        requestedQuodratTF.inputView = percentagePicker
        requestedTahsilyTF.inputView = percentagePicker
        requestedStepExamTF.inputView = percentagePicker
        
        percentagePicker.backgroundColor = UIColor.whiteBackground
    }
    
    // Validates for: empty value, value > 100, value has incorret Double format
    private func validateTextfieldInput(_ textField: DesignableTF) {
        
        textField.hasCorretInputValue = true
        do {
            _ = try textField.validatedText(validationType: .percentage)
        } catch {
            textField.hasCorretInputValue = false
        }
    }
    
    @IBAction func accomplishedThanawiyahTfEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
    }
    
    @IBAction func accoplishedQuodratTfEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
    }
    
    @IBAction func accoplishedTahsilyTfEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
    }
    
    @IBAction func accoplishedStepExamEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
    }
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        scrollView.scrollToBottom()
        calculatedPercentageLabel.fadeTransition(0.4)
        calculatedPercentageLabel.text = "نسبتك الموزونة: \(self.accoplishedThanawiyahTF.text ?? "")٪"
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            
            self.calculatedPercangedStackViewYPosition.constant = 220
            self.view.layoutIfNeeded()
            
        }) { (_) in
            
        }
    }
}
