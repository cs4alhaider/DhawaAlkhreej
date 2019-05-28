//
//  SearchVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 25/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class SearchVC: BaseViewController {

    @IBOutlet weak var searchTextField: SearchTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        searchTextField.delegate = self
        searchTextField.placeholder = "ابحث بالتخصصات"
        
        TestData.getData { (result) in
            switch result {
            case .success(let data):
                AlertHelper.showAlert(vc: self, .normal, title: "Data", body: "\(data.map({$0.title}))", buttonTitle: "Ok", completion: nil)
            case .failure(let error):
                AlertHelper.showAlert(vc: self, .normal, title: "Error", body: error.localizedDescription, buttonTitle: "Ok", completion: nil)
            }
        }
    }
}

extension SearchVC: SearchTextFieldDelegate {
    func searchTextDidChanged(to text: String) {
        logger(text)
    }
}
