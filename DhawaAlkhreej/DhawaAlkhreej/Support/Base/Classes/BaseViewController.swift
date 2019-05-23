//
//  BaseViewController.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        addKeyboardHidingGesture()
    }
    
    func setupUI() {}
    
    func setupTableView() {}
}
