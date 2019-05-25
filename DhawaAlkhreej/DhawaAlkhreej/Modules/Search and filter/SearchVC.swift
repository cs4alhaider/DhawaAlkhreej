//
//  SearchVC.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 25/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class SearchVC: BaseViewController {

    @IBOutlet weak var searchTextField: SearchTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        searchTextField.delegate = self
        searchTextField.placeholder = "ابحث بالتخصصات"
    }

}

extension SearchVC: SearchTextFieldDelegate {
    func searchTextDidChanged(to text: String) {
        logger(text)
    }
}
