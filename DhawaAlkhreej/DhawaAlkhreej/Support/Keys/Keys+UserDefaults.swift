//
//  Keys+UserDefaults.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 18/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Foundation

/*--------------------------------------------------------------------------------*/
/// Add every UserDefaults key here to organize our work and to avoid dublications.
/*--------------------------------------------------------------------------------*/

import Foundation

extension Keys {
    
    /// Namespacing the constants we use in the defaults system.
    struct UserDefaults {
        
        /// Save the number of times the user launch the app for rating purpose - "DhawaAlkhreej.UserDefaults.numberOfOpeningTheApp"
        static let numberOfOpeningTheApp = "DhawaAlkhreej.UserDefaults.numberOfOpeningTheApp"
        
        /// Determine if the it's the first time to present the onboarding process - "DhawaAlkhreej.UserDefaults.isFirstTime"
        static let isFirstTime = "DhawaAlkhreej.UserDefaults.isFirstTime"
        
        /// set & get the saved|fav items - "DhawaAlkhreej.UserDefaults.savedItems"
        static let savedItems = "DhawaAlkhreej.UserDefaults.savedItems"
        
        struct TextfieldsData {
            
            static let requestedThanawiyahTF = "DhawaAlkhreej.UserDefaults.requestedThanawiyahTF"
            static let requestedQuodratTF = "DhawaAlkhreej.UserDefaults.requestedQuodratTF"
            static let requestedTahsilyTF = "DhawaAlkhreej.UserDefaults.requestedTahsilyTF"
            static let requestedStepExamTF = "DhawaAlkhreej.UserDefaults.requestedStepExamTF"
            
            static let accoplishedThanawiyahTF = "DhawaAlkhreej.UserDefaults.accoplishedThanawiyahTF"
            static let accomplishedQuodratTF = "DhawaAlkhreej.UserDefaults.accomplishedQuodratTF"
            static let accomplishedTahsilyTF = "DhawaAlkhreej.UserDefaults.accomplishedTahsilyTF"
            static let accomplishedStepExamTF = "DhawaAlkhreej.UserDefaults.accomplishedStepExamTF"
        }
    }
}
