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
        Helper.feedbackGenerator(type: .light)
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
        
        // Add shadow movment with the device movment
        let horizontalEffect = UIInterpolatingMotionEffect(
            keyPath: "layer.shadowOffset.width",
            type: .tiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = 16
        horizontalEffect.maximumRelativeValue = -16

        let verticalEffect = UIInterpolatingMotionEffect(
            keyPath: "layer.shadowOffset.height",
            type: .tiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = 16
        verticalEffect.maximumRelativeValue = -16

        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [horizontalEffect, verticalEffect]
        getStartedButton.addMotionEffect(effectGroup)
        
        // Add button movment with the device movment
        let horizontalEffect1 = UIInterpolatingMotionEffect(
            keyPath: "center.x",
            type: .tiltAlongHorizontalAxis)
        horizontalEffect1.minimumRelativeValue = -16
        horizontalEffect1.maximumRelativeValue = 16
        
        let verticalEffect1 = UIInterpolatingMotionEffect(
            keyPath: "center.y",
            type: .tiltAlongVerticalAxis)
        verticalEffect1.minimumRelativeValue = -16
        verticalEffect1.maximumRelativeValue = 16
        
        let effectGroup1 = UIMotionEffectGroup()
        effectGroup1.motionEffects = [horizontalEffect1, verticalEffect1]
        getStartedButton.addMotionEffect(effectGroup1)
    }
    
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: K.UserDefaults.onBoardingViewed)
        dismiss(animated: true, completion: nil)
        Helper.feedbackGenerator(type: .medium)
    }
    
}
