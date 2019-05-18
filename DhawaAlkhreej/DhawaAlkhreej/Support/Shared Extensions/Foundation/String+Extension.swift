//
//  String+Extension.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

extension String {
    
    /// Supporting PrintHelper file
    ///
    /// - Author: Abdullah Alhaider
    var logFilePath: String {
        let pathComponents = self.components(separatedBy: "/")
        let index = pathComponents.lastIndex(of: "DhawaAlkhreej")
        return pathComponents.suffix(pathComponents.count - (index ?? 0)).joined(separator: " > ")
    }
}
