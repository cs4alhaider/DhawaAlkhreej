//
//  Keys+NotificationCenter.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

/*--------------------------------------------------------------------------------*/
/// Add every Notification.Name here to organize our work and to avoid dublications.
/*--------------------------------------------------------------------------------*/

import Foundation

extension Keys {
    
    struct NotificationCenter {
        
        /// Notify the user add a new item to the saved items
        static let updateSavedList = "DhawaAlkhreej.Notification.updateSavedList".asNotificationName
    }
}
