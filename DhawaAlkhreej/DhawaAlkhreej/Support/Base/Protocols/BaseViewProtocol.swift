//
//  BaseViewProtocol.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

protocol BaseViewProtocol { }

/// Making all the UIViewControllers conform to BaseViewProtocol
extension UIViewController: BaseViewProtocol { }

extension BaseViewProtocol where Self: UIViewController {
    
    /// Show an alert
    ///
    /// - Parameters:
    ///   - title: title of the alert
    ///   - buttonTitle: button Title
    ///   - body: message of the alert
    func alert(title: String, body: String, buttonTitle: String = "OK", completion: (() -> Void)? = nil) {
        H4S.showOneActionAlert(vc: Self.init(), title: title, message: body, buttonTitle: buttonTitle, buttonHandler: completion)
    }
    
    /// Showing a loading indecitor
    ///
    /// - Parameters:
    ///   - time: time till the loader dissiper
    ///   - completion: `(() -> Void)? = nil`
    func startLoading(for time: TimeInterval = .infinity, completion: (() -> Void)? = nil) {
        
    }
    
    /// Stopping the loader
    ///
    /// - Parameter completion: `(() -> Void)? = nil`
    func stopLoading(with completion: (() -> Void)? = nil) {
        
    }
}
