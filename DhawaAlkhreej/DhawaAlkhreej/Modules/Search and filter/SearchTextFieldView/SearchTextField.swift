//
//  SearchTextField.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 25/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

protocol SearchTextFieldDelegate: class {
    func searchDidBegin(with text: String)
    func searchTextDidChanged(to text: String)
    func searchDidEnd(with text: String)
    func searchCancelled()
}

extension SearchTextFieldDelegate { // making them optional
    func searchDidBegin(with text: String) {}
    func searchTextDidChanged(to text: String) {}
    func searchDidEnd(with text: String) {}
    func searchCancelled() {}
}

@IBDesignable
class SearchTextField: UIView {
    
    @IBOutlet weak private var cancelButton: UIButton!
    @IBOutlet weak private var textBackView: UIView!
    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var searchImageView: UIImageView!
    
    weak var delegate: SearchTextFieldDelegate?
    
    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    var placeholderTextColor: UIColor = UIColor.brownTextColor.withAlphaComponent(0.4) {
        didSet {
            textField.setPlaceHolderTextColor(placeholderTextColor)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    private func setupView() {
        addSubviewFromNib()
        setupUI()
    }
    
    private func setupUI() {
        textBackView.layer.cornerRadius = 12
        textBackView.layer.borderColor = Identity.color(.brownBackground).cgColor
        textBackView.layer.borderWidth = 1
        textField.placeholder = placeholder
        textField.setPlaceHolderTextColor(placeholderTextColor)
    }
    
    @IBAction private func cancelTapped(_ sender: UIButton) {
        delegate?.searchCancelled()
    }
    
    @IBAction private func clearTapped(_ sender: UIButton) {
        guard let text = textField.text, text.isNotEmpty else { return }
        textField.text = nil
    }
    
    @IBAction private func editingDidBegin(_ sender: UITextField) {
        guard let text = sender.text else { return }
        delegate?.searchDidBegin(with: text)
    }
    
    @IBAction private func editingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        delegate?.searchTextDidChanged(to: text)
    }
    
    @IBAction private func editingDidEnd(_ sender: UITextField) {
        guard let text = sender.text else { return }
        delegate?.searchDidEnd(with: text)
    }
}
