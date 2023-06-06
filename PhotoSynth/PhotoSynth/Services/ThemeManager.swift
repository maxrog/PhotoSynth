//
//  ThemeManager.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import Foundation
import Combine
import SwiftUI

/*
 TODO instead of just light or dark mode, user should be able to fine comb colors (accent)
 Can just have a color palette below these settings to change the main accent color
 
TODO test system preference + changing back and forth
 // TODO should / can this use AppStorage?
 */


/// Manager for the user's app/color theme preference
class ThemeManager: ObservableObject {
    
    // MARK: Preferences
    
    /// Mark the user's preferred theming style
    @Published private(set) var preferredStyle: PreferredUserInterfaceStyle = .system
    
    /// Whether user has opted to use something other than system settings
    var shouldOverrideSystemSetting: Bool {
        get { UserDefaults.standard.bool(forKey:ThemeUserDefaults.overrideSystemKey) }
        set {
            UserDefaults.standard.set(newValue, forKey:ThemeUserDefaults.overrideSystemKey)
            updateThemeSubject()
        }
    }
    
    /// Whether user has opted for a light or a dark mode
    var shouldApplyDarkMode: Bool {
        get { UserDefaults.standard.bool(forKey: ThemeUserDefaults.applyDarkModeKey) }
        set {
            UserDefaults.standard.set(newValue, forKey: ThemeUserDefaults.applyDarkModeKey)
            updateThemeSubject()
        }
    }
    
    /// Update the current value subject when settings change
    private func updateThemeSubject() {
        if shouldOverrideSystemSetting {
            preferredStyle = shouldApplyDarkMode ? .dark : .light
        } else {
            preferredStyle = .system
        }
    }
    
    // MARK: Colors
    
    private lazy var systemInDarkMode: Bool = {
        UIScreen.main.traitCollection.userInterfaceStyle == .dark
    }()
    
    var textColor: Color {
        switch preferredStyle {
        case .dark:
            return Color.white
        case .light:
            return Color.black
        case .system:
            return systemInDarkMode ? Color.white : Color.black
        }
    }
    
    var backgroundColor: Color {
        switch preferredStyle {
        case .dark:
            return Color.black
        case .light:
            return Color.white
        case .system:
            return systemInDarkMode ? Color.black : Color.white
        }
    }
    
    // TODO
    var accentColor: Color {
        return Color.green
    }
    
}

/// User's preferred user interface style
enum PreferredUserInterfaceStyle {
    case dark, light, system
}

/// User Default Keys
private struct ThemeUserDefaults {
    static let overrideSystemKey = "rogers.max.photosynth.themeoverridesystemsettingkey"
    static let applyDarkModeKey = "rogers.max.photosynth.applydarkmodekey"
}
