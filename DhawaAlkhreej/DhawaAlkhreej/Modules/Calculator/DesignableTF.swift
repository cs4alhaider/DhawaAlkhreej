//
//  IBDesignableTF.swift
//  DhawaAlkhreej
//
//  Created by FarouK on 22/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

@IBDesignable class DesignableTF: UITextField {
    
    // MARK: Buttom Border TextField Image
    @IBInspectable var buttomBorder: CGFloat = 0 {
        didSet {
            setBottomBorder(withColor: buttomBorderColor, borderHeight: buttomBorder)
        }
    }
    
    @IBInspectable var buttomBorderColor: UIColor = .black {
        didSet {
            setBottomBorder(withColor: buttomBorderColor, borderHeight: buttomBorder)
        }
    }
    
    // MARK: Right TextField Image
    @IBInspectable var rightImage: UIImage? {
        didSet {
            right(image: rightImage, color: rightColor, width: rightWidth, height: rightHeight)
        }
    }
    @IBInspectable var rightColor: UIColor = .black {
        didSet {
            right(image: rightImage, color: rightColor, width: rightWidth, height: rightHeight)
        }
    }
    @IBInspectable var rightWidth: CGFloat = 0 {
        didSet {
            right(image: rightImage, color: rightColor, width: rightWidth, height: rightHeight)
        }
    }
    @IBInspectable var rightHeight: CGFloat = 0 {
        didSet {
            right(image: rightImage, color: rightColor, width: rightWidth, height: rightHeight)
        }
    }
    
    // MARK: Left TextField Image
    @IBInspectable var leftImage: UIImage? {
        didSet {
            left(image: leftImage, color: leftColor, width: leftWidth, height: leftHeight)
        }
    }
    @IBInspectable var leftColor: UIColor = .black {
        didSet {
            left(image: leftImage, color: leftColor, width: leftWidth, height: leftHeight)
        }
    }
    @IBInspectable var leftWidth: CGFloat = 0 {
        didSet {
            left(image: leftImage, color: leftColor, width: leftWidth, height: leftHeight)
        }
    }
    @IBInspectable var leftHeight: CGFloat = 0 {
        didSet {
            left(image: leftImage, color: leftColor, width: leftWidth, height: leftHeight)
        }
    }
    
}
