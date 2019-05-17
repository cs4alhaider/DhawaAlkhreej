//
//  PrintHelper.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

/// A logger for this app, identical to the native `print` statement
///
/// This will help us to stop printing any thing to the console
/// if we want at any time to look for something important.
///
/// Also this function should be used for print statements that are always required for
/// debugging and shouldn't be removed as the print statement should not
/// exist in the production environment.
/// Reference for printing the file name and function name and line number from:
/// https://docs.swift.org/swift-book/ReferenceManual/Expressions.html
///
/// - Author: Abdullah Alhaider
func logger<T>(_ items: T, file: String = #file, function: String = #function, line: Int = #line) {
    if Environment.isDevelopment {
        print("""
            \n==> ✍️ Log called from file: \(file.logFilePath)
            ==> 📝 Function name: \(function)
            ==> 📄 Line number: \(line)
            ===================== 📬 Begin 📬 =========================
            \(items)
            ====================== 📪 End 📪 ==========================
            """)
    }
}

/// This function will be used for the network only.
///
/// - Author: Abdullah Alhaider
func logNetwork<T>(_ items: T, separator: String = " ", terminator: String = "\n") {
    if Environment.isDevelopment {
        print("""
            \n===================== 📟 ⏳ 📡 =========================
            \(items)
            ======================= 🚀 ⌛️ 📡 =========================
            """, separator: separator, terminator: terminator)
    }
}

/// This function will be used for logging the errors to help doing
/// some modifiction like send send all the error to the backend ... etc.
///
/// - Author: Abdullah Alhaider
func logError<T>(_ items: T, file: String = #file, function: String = #function, line: Int = #line) {
    if Environment.isDevelopment {
        print("""
            \n==> ‼️ Error log coming from file: \(file.logFilePath)
            ==> ‼️ Function name: \(function)
            ==> ‼️ Line number: \(line)
            ===================== ❌ Begin ❌ =========================
            \(items)
            ====================== ❌ End ❌ ==========================
            """)
    } else {
        // notaTODO: Configure here to send the error with user information
        // and deviceID, app version ... etc details to the backend
    }
}
