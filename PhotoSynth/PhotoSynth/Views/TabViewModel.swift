//
//  TabViewModel.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/8/23.
//

import SwiftUI

// TODO - allow user to set whether this is enabled

enum Tabs: Int {
    case discover = 0
    case log
    case settings
}

/// View model to persist tab selection
class TabViewModel: ObservableObject {
    
    /// User's selected tab in main tab view
    @AppStorage(StorageKeys.selectedTabIndex.rawValue) var selectedTabIndex: Int = 0
    
}

fileprivate
enum StorageKeys: String {
    case selectedTabIndex
}
