//
//  PageViewController.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 21/06/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class PageController: BaseViewController {
    
    @IBOutlet var textLabel: UILabel! {
        didSet {
            textLabel.font = Identity.font(.custom(weight: .bold, size: 23))
            textLabel.textColor = .brownTextColor
            textLabel.numberOfLines = 0
        }
    }
    @IBOutlet var getStartedButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    var index = 0
    var text = ""
    var imageName = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show getStarted button on the last screen only
        if index == 2 {
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.5, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func setupUI() {
        setupGetStartedButton()
        textLabel.text = text
        imageView.image = UIImage(named: imageName)
        getStartedButton.alpha = 0
    }
    
    private func setupGetStartedButton() {
        
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.shadowOffset = CGSize.zero
        getStartedButton.layer.shadowOpacity = 0.2
        getStartedButton.titleLabel?.font = Identity.font(.custom(weight: .bold, size: 20))
    }
    
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        // UserDefaults.standard.set(true, forKey: K.UserDefaults.onBoardingViewed)
        dismiss(animated: true, completion: nil)
    }
    
}
