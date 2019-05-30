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
        retrieveTextfieldsData()
        setupNavbarButtons()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.calculateButton.changeStatus(to: .disabled)
        }
    }
    
    private func setupNavbarButtons() {
        
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "trash"), style: .plain, target: self, action: #selector(deleteTextfieldsValues))
        navigationItem.rightBarButtonItem = button
        
    }
    
    @objc private func deleteTextfieldsValues() {
        
        AlertHelper.showTwoActionsAlert(vc: self, title: "حذف القيم", message: "سيتم حذف جميع القيم المدخلة", btn1Title: "حذف", btn2Title: "إلغاء") {
            self.changeTextField(self.getTextFields(.all), text: "")
            
            // Delete saved values in UserDefaults
            UserDefaults.standard.set(nil, forKey: K.UserDefaults.savedTextfields)
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
        
        changeTextField(getTextFields(.all), tintColor: .primary)
    }
    
    func saveTextfieldData(_ textFieldName: TextFieldName, data: String) {
        
        var dic = UserDefaults.standard.value(forKey: K.UserDefaults.savedTextfields) as? [String: String]
        
        if dic == nil {
            var newDic: [String: String]? = [:]
            newDic?[textFieldName.rawValue] = data
            UserDefaults.standard.set(newDic, forKey: K.UserDefaults.savedTextfields)
        } else {
            dic?[textFieldName.rawValue] = data
            UserDefaults.standard.set(dic, forKey: K.UserDefaults.savedTextfields)
        }
        
    }
    
    private func validstesAccoplishedTFsInputs() {
        DispatchQueue.main.async {
            self.validateTextfieldInput(self.accoplishedThanawiyahTF)
            self.validateTextfieldInput(self.accomplishedQuodratTF)
            self.validateTextfieldInput(self.accomplishedTahsilyTF)
            self.validateTextfieldInput(self.accomplishedStepExamTF)
        }
    }
    
    private func retrieveTextfieldsData() {
        
        if let data = UserDefaults.standard.value(forKey: K.UserDefaults.savedTextfields) as? [String: String] {
            
            requestedThanawiyahTF.text = data[TextFieldName.requestedThanawiyahTF.rawValue]
            requestedQuodratTF.text = data[TextFieldName.requestedQuodratTF.rawValue]
            requestedTahsilyTF.text = data[TextFieldName.requestedTahsilyTF.rawValue]
            requestedStepExamTF.text = data[TextFieldName.requestedStepExamTF.rawValue]
            accoplishedThanawiyahTF.text = data[TextFieldName.accoplishedThanawiyahTF.rawValue]
            accomplishedQuodratTF.text = data[TextFieldName.accomplishedQuodratTF.rawValue]
            accomplishedTahsilyTF.text = data[TextFieldName.accomplishedTahsilyTF.rawValue]
            accomplishedStepExamTF.text = data[TextFieldName.accomplishedStepExamTF.rawValue]
        }
        
        validstesAccoplishedTFsInputs()
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
        saveTextfieldData(.accoplishedThanawiyahTF, data: sender.text ?? "")
    }
    
    @IBAction func accoplishedQuodratTfEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
        saveTextfieldData(.accomplishedQuodratTF, data: sender.text ?? "")
    }
    
    @IBAction func accoplishedTahsilyTfEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
        saveTextfieldData(.accomplishedTahsilyTF, data: sender.text ?? "")
    }
    
    @IBAction func accoplishedStepExamEditingChanged(_ sender: DesignableTF) {
        validateTextfieldInput(sender)
        saveTextfieldData(.accomplishedStepExamTF, data: sender.text ?? "")
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
    
    enum TextFieldName: String {
        
        case requestedThanawiyahTF
        case requestedQuodratTF
        case requestedTahsilyTF
        case requestedStepExamTF
        case accoplishedThanawiyahTF
        case accomplishedQuodratTF
        case accomplishedTahsilyTF
        case accomplishedStepExamTF
    }
    
    private enum TextFieldType {
        case all
        case requested
        case accomplished

    }
    
    private func getTextFields(_ type: TextFieldType) -> [UITextField] {
        
        switch type {
        case .all:
            return [requestedThanawiyahTF, requestedQuodratTF, requestedTahsilyTF, requestedStepExamTF, accoplishedThanawiyahTF, accomplishedQuodratTF,
                    accomplishedTahsilyTF, accomplishedStepExamTF]
        case .requested:
            return [requestedThanawiyahTF, requestedQuodratTF, requestedTahsilyTF, requestedStepExamTF]
        case .accomplished:
            return [accoplishedThanawiyahTF, accomplishedQuodratTF, accomplishedTahsilyTF, accomplishedStepExamTF]
        }
    }
}
