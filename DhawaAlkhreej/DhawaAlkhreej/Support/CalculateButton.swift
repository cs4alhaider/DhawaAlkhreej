//
//  CalculateButton.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 26/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class CalculateButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    enum PreLoginButtonsStatus {
        case enabled
        case disabled
    }
    
    private func setup() {
        changeStatus(to: .enabled)
        titleLabel?.font = Identity.font(.h3)
    }
    
    func changeStatus(to status: PreLoginButtonsStatus, duration: TimeInterval = 0.4) {
        switch status {
        case .enabled:
            set(backgroundColor: UIColor.primary, titleColor: UIColor.whiteTextColor, isEnabled: true, duration: duration)
        case .disabled:
            set(backgroundColor: UIColor.primary.withAlphaComponent(0.4), titleColor: UIColor.whiteTextColor.withAlphaComponent(0.4), isEnabled: false, duration: duration)
        }
    }
    
    private func set(backgroundColor: UIColor, titleColor: UIColor, isEnabled: Bool, duration: TimeInterval = 0.4) {
        animate(.changeColor(to: backgroundColor, duration: duration))
        buttonAnimation(.changeTextColor(to: titleColor, duration: duration))
        self.isEnabled = isEnabled
    }
    
}
