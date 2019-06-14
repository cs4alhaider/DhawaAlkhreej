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
    
    /// Convert English numbers to Arabic numbers
    ///
    /// - Author: Abdullah Alhaider
    var toArabicNumbers: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $1, with: $0) }
        return str
    }
}
