//
//  UIView+Extension.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 26/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTransition(_ duration: CFTimeInterval) {
        
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
