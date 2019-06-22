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
        animateImageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func setupUI() {
        setupGetStartedButton()
        setupImageView()
        textLabel.text = text
    }
    
    private func setupGetStartedButton() {
        getStartedButton.alpha = 0
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.shadowOffset = CGSize.zero
        getStartedButton.layer.shadowOpacity = 0.2
        getStartedButton.titleLabel?.font = Identity.font(.custom(weight: .bold, size: 20))
        
        addMotionEffects(to: getStartedButton, shadow: true, movement: true)
    }
    
    private func setupImageView() {
        
        imageView.image = UIImage(named: imageName)
        imageView.layer.shadowOffset = CGSize.zero
        imageView.layer.shadowOpacity = 0.2
        addMotionEffects(to: imageView, shadow: true, movement: true)
    }
    
    @IBAction func getStartedButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: K.UserDefaults.onBoardingViewed)
        Helper.feedbackGenerator(type: .medium)
        dismiss(animated: true, completion: nil)
    }
}

// Some Helper Methods
extension PageController {
    
    private func animateImageView() {
        let transform = CGAffineTransform(scaleX: 0, y: 0)
        self.imageView?.transform = transform
        let transform1 = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.4, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.imageView?.transform = transform1
            UIView.animate(withDuration: 0.1, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.imageView?.transform = .identity
            })
        })
    }
    
    private func addMotionEffects(to view: UIView, shadow: Bool = false, movement: Bool = false) {
        
        // Add shadow movment with the device movment
        if shadow {
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
            view.addMotionEffect(effectGroup)
        }
        
        // Add object movement with the device movment
        if movement {
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
            view.addMotionEffect(effectGroup1)
        }
    }
}
