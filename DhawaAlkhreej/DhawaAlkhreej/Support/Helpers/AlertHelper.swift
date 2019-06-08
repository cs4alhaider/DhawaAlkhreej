//
//  AlertHelper.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

// notaTODO: Add a protocol to handle all alerts

struct AlertHelper {
    
    // MARK: - -------------------------------- Main Alert ----------------------------------------
    
    /// Typealias for alertButtonAction
    ///
    /// - Author: Abdullah Alhaider
    typealias AlertButtonAction = (() -> Void)?
    
    /// Enum for alert type
    ///
    /// - success: success alert
    /// - failure: failure alert
    /// - normal: normal alert
    ///
    /// - Author: Abdullah Alhaider
    enum AlertType {
        case success, failure, normal
        
    }
    
    /// Show an alert with diffrent configations like time to dismiss this alert and button completion and is it .success or .normal
    ///
    /// - Parameters:
    ///   - vc: UIViewController to show this alert on
    ///   - alertType: type of the alert like .success to show green alert
    ///   - title: alert title
    ///   - body: alert message
    ///   - dismissAfter: time to dismiss the alert
    ///   - buttonTitle: button title
    ///   - completion: button action completion
    ///
    /// - Author: Abdullah Alhaider
    static func showAlert(vc: UIViewController,
                          _ alertType: AlertType,
                          title: String? = nil,
                          body: String? = nil,
                          dismissAfter: TimeInterval? = nil,
                          buttonTitle: String? = nil,
                          completion: AlertButtonAction = nil) {
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        if let buttonTitle = buttonTitle {
            let ok = UIAlertAction(title: buttonTitle, style: .default) { (_) in
                completion?()
            }
            alert.addAction(ok)
        }
        // Accessing alert view backgroundColor :
        switch alertType {
        case .success:
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case .failure:
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = #colorLiteral(red: 0.7967291667, green: 0.1695612325, blue: 0.08168510124, alpha: 1)
        case .normal:
            break
        }
        // Accessing buttons tintcolor :
        alert.view.tintColor = .black
        
        // presinting the alert controller ...
        vc.present(alert, animated: true, completion: nil)
        
        if let timeToDismiss = dismissAfter {
            DispatchQueue.main.asyncAfter(deadline: .now() + timeToDismiss) {
                vc.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    /* -------------------------------- Basic Alerts ---------------------------------------- */
    
    /// show a basic alert with title and message only
    ///
    /// - Parameters:
    ///   - vc: UIViewController to show this alert on
    ///   - title: alert title
    ///   - message: alert message
    ///   - buttonTitle: alert button text
    ///
    /// - Author: Abdullah Alhaider
    static func showBasicAlert(vc: UIViewController, title: String?, message: String?, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
    /// show an alert with title, message and one button with action
    ///
    /// - Parameters:
    ///   - vc: UIViewController to show this alert on
    ///   - title: title to set
    ///   - message: message to set
    ///   - buttonTitle: button title to set
    ///   - buttonHandler: completion handler for the button
    ///
    /// - Author: Abdullah Alhaider
    static func showOneActionAlert(vc: UIViewController, title: String?, message: String?, buttonTitle: String, buttonHandler: AlertButtonAction = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default) { _ in
            buttonHandler?()
        })
        vc.present(alert, animated: true, completion: nil)
    }
    
    /// show an alert with title, message and two buttons
    ///
    /// - Parameters:
    ///   - title: title to set
    ///   - message: message to set
    ///   - btn1Title: button 1 title to set
    ///   - btn2Title: button 2 title to set
    ///   - btn1Handler: completion handler for the first button
    ///
    /// - Author: Abdullah Alhaider
    static func showTwoActionsAlert(vc: UIViewController,
                                    title: String?,
                                    message: String?,
                                    btn1Title: String,
                                    btn2Title: String,
                                    btn1Handler: AlertButtonAction = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: btn1Title, style: .destructive) { _ in
            btn1Handler?()
        }
        let action2 = UIAlertAction(title: btn2Title, style: .default)
        alert.addAction(action1)
        alert.addAction(action2)
        vc.present(alert, animated: true, completion: nil)
    }
}
