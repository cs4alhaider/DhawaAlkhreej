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
    var errorMessage: String = ""
    var numOfEnteredTFs: Int = 0
    
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
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        //            self.calculateButton.changeStatus(to: .disabled)
        //        }
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
            self.numOfEnteredTFs = 0
            self.errorMessage = ""
            UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                
                self.calculatedPercangedStackViewYPosition.constant = 500
                self.view.layoutIfNeeded()
                
            })
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
            if !self.accoplishedThanawiyahTF.text!.isEmpty {
                 self.validateTextfieldInput(self.accoplishedThanawiyahTF)
            }
            if !self.accomplishedQuodratTF.text!.isEmpty {
                self.validateTextfieldInput(self.accomplishedQuodratTF)
            }
            if !self.accomplishedTahsilyTF.text!.isEmpty {
                self.validateTextfieldInput(self.accomplishedTahsilyTF)
            }
            if !self.accomplishedStepExamTF.text!.isEmpty {
                self.validateTextfieldInput(self.accomplishedStepExamTF)
            }
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
        errorMessage = ""
        textField.hasCorretInputValue = true
        do {
            _ = try textField.validatedText(validationType: .percentage)
        } catch let error {
            textField.hasCorretInputValue = false
            errorMessage = (error as? ValidationError)?.message ?? ""
            
        }
    }
    
    private func checkForNumberOfEnteredTFs() throws {
        numOfEnteredTFs = 0
        if !accoplishedThanawiyahTF.text!.isEmpty {
            numOfEnteredTFs += 1
        }
        if !accomplishedQuodratTF.text!.isEmpty {
            numOfEnteredTFs += 1
        }
        if !accomplishedTahsilyTF.text!.isEmpty {
            numOfEnteredTFs += 1
        }
        if !accomplishedStepExamTF.text!.isEmpty {
            numOfEnteredTFs += 1
        }
        
        if numOfEnteredTFs < 2 {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال درجتين على الأقل لحساب النسبة المئوية!", buttonTitle: "حسناً")
            throw ValidationError("")
        }
    }
    
    private func validateForAccomplishedAndRequestedTFs() throws {
        
        let requestedThanawiyahTFValue: Double = (Double(String((requestedThanawiyahTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        let requestedQuodratTFValue: Double = (Double(String((requestedQuodratTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        let requestedTahsilyTFValue: Double = (Double(String((requestedTahsilyTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        let requestedStepExamTFValue: Double = (Double(String((requestedStepExamTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        
        if (accoplishedThanawiyahTF.text!.isEmpty) && (requestedThanawiyahTF.text!.isNotEmpty && requestedThanawiyahTFValue != 0) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال درجتك في الثانوية", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if (accomplishedQuodratTF.text!.isEmpty) && (requestedQuodratTF.text!.isNotEmpty && requestedQuodratTFValue != 0) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال درجتك في القدرات", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if (accomplishedTahsilyTF.text!.isEmpty) && (requestedTahsilyTF.text!.isNotEmpty && requestedTahsilyTFValue != 0) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال درجتك في التحصيلي", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if (accomplishedStepExamTF.text!.isEmpty) && (requestedStepExamTF.text!.isNotEmpty && requestedStepExamTFValue != 0) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال درجتك في اختبار STEP", buttonTitle: "حسناً")
            throw ValidationError("")
        }
        
        if (!accoplishedThanawiyahTF.text!.isEmpty) && (requestedThanawiyahTF.text!.isEmpty) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال النسبة المطلوبة في الجامعة لدرجة الثانوية", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if (!accomplishedQuodratTF.text!.isEmpty) && (requestedQuodratTF.text!.isEmpty) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال النسبة المطلوبة في الجامعة لدرجة القدرات", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if (!accomplishedTahsilyTF.text!.isEmpty) && (requestedTahsilyTF.text!.isEmpty) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال النسبة المطلوبة في الجامعة لدرجة التحصيلي", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if (!accomplishedStepExamTF.text!.isEmpty) && (requestedStepExamTF.text!.isEmpty) {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "يجب إدخال النسبة المطلوبة في الجامعة لدرجة اختبار STEP", buttonTitle: "حسناً")
            throw ValidationError("")
        }
    }
    
    private func calulatePercentage() throws -> Double {
        
        let accoplishedThanawiyahTFText = String((accoplishedThanawiyahTF.text) ?? "0").toEnglishNumbers
        let accomplishedQuodratTFText = String((accomplishedQuodratTF.text) ?? "0").toEnglishNumbers
        let accomplishedTahsilyTFText = String((accomplishedTahsilyTF.text) ?? "0").toEnglishNumbers
        let accomplishedStepExamTFText = String((accomplishedStepExamTF.text) ?? "0").toEnglishNumbers
        
        let requestedThanawiyahTFValue: Double = (Double(String((requestedThanawiyahTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        let requestedQuodratTFValue: Double = (Double(String((requestedQuodratTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        let requestedTahsilyTFValue: Double = (Double(String((requestedTahsilyTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        let requestedStepExamTFValue: Double = (Double(String((requestedStepExamTF.text?.dropFirst()) ?? "0").toEnglishNumbers) ?? 0.0) / 100
        
        let totalPercentage = requestedThanawiyahTFValue + requestedQuodratTFValue + requestedTahsilyTFValue + requestedStepExamTFValue
        if totalPercentage.rounded(toPlaces: 1) > 1 {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "لا يمكن لمجموع النسب المطلوبة من الجامعة أن تتجاوز ١٠٠٪", buttonTitle: "حسناً")
            throw ValidationError("")
        } else if totalPercentage.rounded(toPlaces: 1) != 1 {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: "مجموع النسب المطلوبة من الجامعة يجب أن يساوي ١٠٠٪", buttonTitle: "حسناً")
            throw ValidationError("")
        }
        
        let ThanawiyahPart: Double = (Double(accoplishedThanawiyahTFText) ?? 0.0) * requestedThanawiyahTFValue
        let QuodratPart: Double = (Double(accomplishedQuodratTFText) ?? 0.0) * requestedQuodratTFValue
        let TahsilyPart: Double = (Double(accomplishedTahsilyTFText) ?? 0.0) * requestedTahsilyTFValue
        let StepExamPart: Double = (Double(accomplishedStepExamTFText) ?? 0.0) * requestedStepExamTFValue
        
        let calcultedPercetage: Double = ThanawiyahPart + QuodratPart + TahsilyPart + StepExamPart
        return calcultedPercetage.rounded(toPlaces: 2)
        
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

        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            
            self.calculatedPercangedStackViewYPosition.constant = 500
            self.view.layoutIfNeeded()
            
        })
        
        do {
            try checkForNumberOfEnteredTFs()
        } catch {
            return
        }
        
        var calcultedPercetage: Double
        do {
            calcultedPercetage = try calulatePercentage()
        } catch {
            return
        }
        
        do {
            try validateForAccomplishedAndRequestedTFs()
        } catch {
            return
        }
        
        if errorMessage != "" {
            AlertHelper.showOneActionAlert(vc: self, title: "خطأ", message: errorMessage, buttonTitle: "حسناً")
            return
        }
        // let arabicPercentage = String(calcultedPercetage).toArabicNumbers.replacingOccurrences(of: ".", with: "٫")
        // FIXME: Convert the number to arabic one.
        scrollView.scrollToBottom()
        calculatedPercentageLabel.fadeTransition(0.4)
        calculatedPercentageLabel.text = "نسبتك الموزونة: \(calcultedPercetage)٪"
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            
            self.calculatedPercangedStackViewYPosition.constant = 220
            self.view.layoutIfNeeded()
            
        }) { (_) in
            
        }
    }
}

extension CalculatorVC {
    
    // Used to save textfields values in UserDefualts
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
