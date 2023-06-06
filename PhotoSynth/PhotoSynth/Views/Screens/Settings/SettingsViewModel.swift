//
//  SettingsViewModel.swift
//  Scuff
//
//  Created by Max Rogers on 6/6/23.
//

import SwiftUI

/// View model to manage user settings
class SettingsViewModel: ObservableObject {
    
    /// User's selected tab in main tab view
    @AppStorage(StorageKeys.selectedTabIndex.rawValue) var selectedTabIndex: Int = 0
    
    /// User's theme preference manager
    @Published var theme: ThemeManager
    
    init() {
        theme = ThemeManager()
    }
    
}

fileprivate
enum StorageKeys: String {
    case selectedTabIndex
}
