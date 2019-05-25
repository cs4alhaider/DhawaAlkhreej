//
//  UIScrollView+Extenstion.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 26/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func scrollToBottom() {
        
        let curretDevice = UIDevice.current.name
        if curretDevice == "iPhone 5s" || curretDevice == "iPhone SE" {
            let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
